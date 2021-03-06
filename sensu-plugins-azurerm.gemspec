# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'
require 'sensu-plugins-azurerm/version'

Gem::Specification.new do |s|
  s.authors                = ['Tom Harvey']
  s.date                   = Date.today.to_s
  s.description            = 'This plugin provides checks for Microsoft Azure\'s Resource Manager service.'
  s.email                  = '<github@ibuildstuff.co.uk>'
  s.executables            = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  s.files                  = Dir.glob('{bin,lib}/**/*') + %w[LICENSE README.md CHANGELOG.md]
  s.homepage               = 'https://github.com/sensu-plugins/sensu-plugins-azurerm'
  s.license                = 'MIT'
  s.metadata               = { 'maintainer' => 'Tom Harvey',
                               'development_status' => 'active',
                               'production_status' => 'unstable - testing recommended',
                               'release_draft' => 'false',
                               'release_prerelease' => 'false' }
  s.name                   = 'sensu-plugins-azurerm'
  s.platform               = Gem::Platform::RUBY
  s.post_install_message   = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'
  s.require_paths          = ['lib']
  s.required_ruby_version  = '>= 2.3.0'
  s.summary                = 'Sensu plugins for working with an Azure Resource Manager environment'
  s.test_files             = s.files.grep(%r{^(test|spec|features)/})
  s.version                = SensuPluginsAzureRM::Version::VER_STRING

  s.add_runtime_dependency 'azure_mgmt_compute', '0.8.0'
  s.add_runtime_dependency 'azure_mgmt_network', '0.8.0'
  s.add_runtime_dependency 'azure_mgmt_service_bus', '0.8.0'
  s.add_runtime_dependency 'ms_rest_azure', ['>= 0.6.2', '< 0.12.0']
  s.add_runtime_dependency 'sensu-plugin', '~> 4.0'

  s.add_development_dependency 'bundler',                   '~> 2.1'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  s.add_development_dependency 'github-markup',             '~> 4.0'
  s.add_development_dependency 'kitchen-docker',            '~> 2.6'
  s.add_development_dependency 'kitchen-localhost',         '~> 0.3'
  s.add_development_dependency 'pry',                       '~> 0.10'
  s.add_development_dependency 'rake',                      '~> 13.0'
  s.add_development_dependency 'rdoc',                      '~> 6.2'
  s.add_development_dependency 'redcarpet',                 '~> 3.2'
  s.add_development_dependency 'rspec',                     '~> 3.4'
  s.add_development_dependency 'rubocop',                   '~> 0.81.0'
  s.add_development_dependency 'serverspec',                '~> 2.41.5'
  s.add_development_dependency 'test-kitchen',              '~> 1.25.0'
  s.add_development_dependency 'webmock',                   '~> 3.1'
  s.add_development_dependency 'yard',                      '~> 0.9.20'
end
