#! /usr/bin/env ruby
#
# check-azurerm-core-usage
#
# DESCRIPTION:
#   Checks an azure monitor metric against thresholds
#
# OUTPUT:
#   plain-text
#
# PLATFORMS:
#   Linux
#   Windows
#
# DEPENDENCIES:
#   gem: ms_rest_azure
#   gem: sensu-plugin
#
#

require 'ms_rest_azure'
require 'erb'

require 'sensu-plugin/check/cli'
require 'sensu-plugins-azurerm'

require 'time'
require 'net/http'

class CheckAzurermMonitorMetric < Sensu::Plugin::Check::CLI
  include SensuPluginsAzureRM

  AZURE_API_VER = "2017-05-01-preview"

  option :tenant_id,
         description: 'ARM Tenant ID. Either set ENV[\'ARM_TENANT_ID\'] or provide it as an option',
         short: '-t ID',
         long: '--tenant ID',
         default: ENV['ARM_TENANT_ID']

  option :client_id,
         description: 'ARM Client ID. Either set ENV[\'ARM_CLIENT_ID\'] or provide it as an option',
         short: '-c ID',
         long: '--client ID',
         default: ENV['ARM_CLIENT_ID']

  option :client_secret,
         description: 'ARM Client Secret. Either set ENV[\'ARM_CLIENT_SECRET\'] or provide it as an option',
         short: '-s SECRET',
         long: '--clientSecret SECRET',
         default: ENV['ARM_CLIENT_SECRET']

  option :subscription_id,
         description: 'ARM Subscription ID',
         short: '-S ID',
         long: '--subscription ID',
         default: ENV['ARM_SUBSCRIPTION_ID']

  option :resource_type,
         description: 'Resource Type.  If specified, the resource should contain the name and not the full id, and the resource namespace/group and subscriptions are also required. Note:  This should not contain the namespace.  Use --resource-namespace instead.',
         short: '-y NAME',
         long: '--resource-type NAME',
         default: ""

  option :resource_namespace,
         description: 'Resource Namespace.  If specified, the resource should contain the name and not the full id, and the resource namespace/group and subscriptions are also required.',
         short: '-n NAME',
         long: '--resource-namespace NAME',
         default: ""

  option :resource_group,
         description: 'Resource Group.  If specified, the resource should contain the name and not the full id, and the resource namespace/group and subscriptions are also required.',
         short: '-g NAME',
         long: '--resource-group NAME',
         default: ""

  option :resource_parent,
         description: 'Resource Parent.',
         short: '-p NAME',
         long: '--resource-parent NAME',
         default: ""


  # example id: /subscriptions/576b7196-d42b-4b63-b696-af3ff33269a7/resourceGroups/test-group-1/providers/Microsoft.Network/virtualNetworkGateways/test-gateway
  option :resource,
         description:  'Either the full id or name of the resource.  If the name is given, then resource type/namespace/group and subscription are required.',
         short: '-r ID',
         long: '--resource ID',
         required: true

  option :metric,
         description:  'The name of the metric',
         short: '-m ID',
         long: '--metric ID',
         required: true

  option :filter,
         description:  "The filter applied to the metric.  See Azure docs for the syntax.  Note: This can be used to segment the return by dimensions, so that the script checks each dimension separately. eg APIName eq '*'",
         short: '-f FILTER',
         long: '--filter FILTER'

  option :aggregation,
         description:  'Aggregation.  This can be Average, Count, Maximum, Minimum, Total',
         short: '-a aggregation',
         long: '--aggregation aggregation',
         default: "average"

  option :warning_over,
         description: 'The warning threshold to check if the metric is forecasted to go over.',
         short: '-w N',
         long: '--warning WARN',
         proc: proc { |val| val.to_i }

  option :critical_over,
         description: 'The critical threshold to check if the metric is forecasted to go over.',
         short: '-c N',
         long: '--critical CRIT',
         proc: proc { |val| val.to_i }

  option :warning_under,
         description: 'The warning threshold to check if the metric is forecasted to go under.',
         short: '-W N',
         long: '--warning-under WARN',
         proc: proc { |val| val.to_i }

  option :critical_under,
         description: 'The critical threshold to check if the metric is forecasted to go under.',
         short: '-C N',
         long: '--critical-under CRIT',
         proc: proc { |val| val.to_i }


  def parse_dimensions(val)
    val.split(',')
      .collect { |dim_str| dim_str.split '=' }
      .collect { |dim_arr| { name: dim_arr[0], value: dim_arr[1] } }
  end

  def run
    if !config[:critical_over] && !config[:warning_over] && !config[:critical_under] && !config[:warning_under]
      critical "At least one threshold must be provided."
    end

    if last_metric_values.empty?
      unknown "There are no metric values for #{config[:metric]} on resource #{config[:resource]} with aggregation #{config[:aggregation]}"
    else
      last_metric_values.each do |metric_val|
        if config[:critical_over] && metric_val[:value] > config[:critical_over].to_f
          critical "Metric #{metric_val[:metric_name]} is #{metric_val[:value]}"
        elsif config[:warning_over] && metric_val[:value] > config[:warning_over].to_f
          warning "Metric #{metric_val[:metric_name]} is #{metric_val[:value]}"
        elsif config[:critical_under] && metric_val[:value] < config[:critical_under].to_f
          critical "Metric #{metric_val[:metric_name]} is #{metric_val[:value]}"
        elsif config[:warning_under] && metric_val[:value] < config[:warning_under].to_f
          warning "Metric #{metric_val[:metric_name]} is #{metric_val[:value]}"
        else
          ok "Metric #{metric_val[:metric_name]} is #{metric_val[:value]}"
        end
      end
    end
  end

  def last_metric_values
    @last_metric_values ||= get_last_metric_values
  end

  def get_last_metric_values
    values = []
    metric_response[:value].each do | metric_resp_value |
      name = metric_resp_value[:name] ? metric_resp_value[:name][:value] : ""

      if metric_resp_value[:timeseries].empty?
        next
      else
        metric_resp_value[:timeseries].each do |ts|
          ts[:data].reverse_each { |metric_value|
            if metric_value[config[:aggregation].to_sym]
              values << {
                value: metric_value[config[:aggregation].to_sym].to_f,
                metric_name: name
              }

              break
            end
          }
        end
      end
    end

    values
  end

  def metric_response
    provider = MsRestAzure::ApplicationTokenProvider.new(
      config[:tenant_id],
      config[:client_id],
      config[:client_secret]
    )

    begin
      url = "https://management.azure.com#{resource}/providers/microsoft.insights/metrics?" +
        "api-version=#{AZURE_API_VER}&" +
        "metric=#{config[:metric]}&" +
        "timespan=#{CGI.escape(timespan)}&" +
        "aggregation=#{config[:aggregation]}"

      url += "&$filter=#{CGI.escape(config[:filter])}" if config[:filter]

      uri = URI.parse(url)

      res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        req = Net::HTTP::Get.new(uri)
        req["Authorization"] = provider.get_authentication_header
        req["Content-Type"] = "application/json"
        http.request(req)
      end
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET,
      EOFError, Net::HTTPBadResponse,
      Net::HTTPHeaderSyntaxError, Net::ProtocolError,
      Errno::ECONNREFUSED => e

      critical e
    end

    handle_response(res)

    JSON.parse(res.body, symbolize_names: true)
  end

  def resource
    @resource ||= build_resource
  end

  def build_resource
    if !config[:resource_type].to_s.empty? || !config[:resource_namespace].to_s.empty? || !config[:resource_group].to_s.empty?

      if config[:resource_type].to_s.empty? ||
        config[:resource_namespace].to_s.empty? ||
        config[:resource_group].to_s.empty? ||
        config[:subscription_id].to_s.empty?

        unknown "If resource type, namespace, or group is given, then all are required along with the subscription id."
      else
        "/subscriptions/#{config[:subscription_id]}/resourceGroups/#{config[:resource_group]}/" +
          "providers/#{resource_type}/#{config[:resource]}"
      end
    else
      config[:resource].start_with?("/") ? config[:resource] : "/" + config[:resource]
    end
  end

  def resource_type
    if config[:resource_parent].to_s.empty?
      "#{config[:resource_namespace]}/#{config[:resource_type]}"
    else
      "#{config[:resource_namespace]}/#{config[:resource_parent]}/#{config[:resource_type]}"
    end
  end

  def timespan
    # 10 min.  This should be enough time to capture the last value, without wasting API credits
    start_date = Time.now - 600
    end_date = Time.now
    "#{start_date.iso8601}/#{end_date.iso8601}"
  end

  def handle_response(res)
    case res
      when Net::HTTPSuccess then
        return
      else
        critical "Failed to get metric:\n#{res.body}"
    end

  end
end