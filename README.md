## Sensu-Plugins-AzureRM

[![Build Status](https://travis-ci.org/tombuildsstuff/sensu-plugins-azurerm.svg?branch=master)](https://travis-ci.org/tombuildsstuff/sensu-plugins-azurerm)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-azurerm.svg)](http://badge.fury.io/rb/sensu-plugins-azurerm)
[![Code Climate](https://codeclimate.com/github/tombuildsstuff/sensu-plugins-azurerm/badges/gpa.svg)](https://codeclimate.com/github/tombuildsstuff/sensu-plugins-azurerm)
[![Test Coverage](https://codeclimate.com/github/tombuildsstuff/sensu-plugins-azurerm/badges/coverage.svg)](https://codeclimate.com/github/tombuildsstuff/sensu-plugins-azurerm)
[![Dependency Status](https://gemnasium.com/tombuildsstuff/sensu-plugins-azurerm.svg)](https://gemnasium.com/tombuildsstuff/sensu-plugins-azurerm)
[![Sensu Bonsai Asset](https://img.shields.io/badge/Bonsai-Download%20Me-brightgreen.svg?colorB=89C967&logo=sensu)](https://bonsai.sensu.io/assets/sensu-plugins/sensu-plugins-azurerm)

## Sensu Asset
The Sensu assets packaged from this repository are built against the
Sensu Ruby runtime environment. When using these assets as part of a
Sensu Go resource (check, mutator or handler), make sure you include
the corresponding Sensu Ruby runtime asset in the list of assets
needed by the resource. The current ruby-runtime assets can be found
[here](https://bonsai.sensu.io/assets/sensu/sensu-ruby-runtime) in the
Bonsai Asset Index](bonsai.sensu.io).

## Functionality

 - check-azurerm-core-usage.rb
 - check-azurerm-cores-d-usage.rb
 - check-azurerm-cores-ds-usage.rb
 - check-azurerm-cores-dsv2-usage.rb
 - check-azurerm-cores-dv2-usage.rb
 - check-azurerm-cores-f-usage.rb
 - check-azurerm-cores-fs-usage.rb
 - check-azurerm-network-interfaces-usage.rb
 - check-azurerm-network-security-groups-usage.rb
 - check-azurerm-public-ip-addresses-usage.rb
 - check-azurerm-route-tables-usage.rb
 - check-azurerm-service-bus-subscription.rb
 - check-azurerm-service-bus-topic-size.rb
 - check-azurerm-static-public-ip-addresses-usage.rb
 - check-azurerm-virtual-machines-usage.rb
 - check-azurerm-virtual-network-gateway-connected.rb
 - check-azurerm-virtual-network-gateway-failover-connected.rb
 - check-azurerm-virtual-networks-usage.rb
 - check-azurerm-monitor-metric.rb
 - metric-azurerm-service-bus-subscription-message-count.rb
 - metric-azurerm-virtual-network-gateway-usage.rb

## Files

* /bin/check-azurerm-core-usage.rb
* /bin/check-azurerm-cores-d-usage.rb
* /bin/check-azurerm-cores-ds-usage.rb
* /bin/check-azurerm-cores-dsv2-usage.rb
* /bin/check-azurerm-cores-dv2-usage.rb
* /bin/check-azurerm-cores-f-usage.rb
* /bin/check-azurerm-cores-fs-usage.rb
* /bin/check-azurerm-network-interfaces-usage.rb
* /bin/check-azurerm-network-security-groups-usage.rb
* /bin/check-azurerm-public-ip-addresses-usage.rb
* /bin/check-azurerm-route-tables-usage.rb
* /bin/check-azurerm-service-bus-subscription.rb
* /bin/check-azurerm-service-bus-topic-size.rb
* /bin/check-azurerm-static-public-ip-addresses-usage.rb
* /bin/check-azurerm-virtual-machines-usage.rb
* /bin/check-azurerm-virtual-network-gateway-connected.rb
* /bin/check-azurerm-virtual-network-gateway-failover-connected.rb
* /bin/check-azurerm-virtual-networks-usage.rb
* /bin/metric-azurerm-service-bus-subscription-message-count.rb
* /bin/metric-azurerm-virtual-network-gateway-usage.rb
* /bin/check-azurerm-monitor-metric.rb


## Usage

**check-azurerm-core-usage.rb**
```
./check-azurerm-core-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-core-usage.rb -t "00000000-0000-0000-0000-000000000000"
                              -c "00000000-0000-0000-0000-000000000000"
                              -S "00000000-0000-0000-0000-000000000000"
                              -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                              -l "eastus2" -w 80 -c 90

./check-azurerm-core-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                              -client_id "00000000-0000-0000-0000-000000000000"
                              -client_secret "00000000-0000-0000-0000-000000000000"
                              -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                              -location "westeurope"
                              -warning_percentage 80
                              -critical_percentage 90
```

**check-azurerm-cores-d-usage.rb**
```
./check-azurerm-cores-d-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-cores-d-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                 -c "00000000-0000-0000-0000-000000000000"
                                 -S "00000000-0000-0000-0000-000000000000"
                                 -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                 -l "eastus2" -w 80 -c 90

./check-azurerm-cores-d-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                 -client_id "00000000-0000-0000-0000-000000000000"
                                 -client_secret "00000000-0000-0000-0000-000000000000"
                                 -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                 -location "westeurope"
                                 -warning_percentage 80
                                 -critical_percentage 90
```

**check-azurerm-cores-ds-usage.rb**
```
./check-azurerm-cores-ds-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-cores-ds-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                  -c "00000000-0000-0000-0000-000000000000"
                                  -S "00000000-0000-0000-0000-000000000000"
                                  -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                  -l "eastus2" -w 80 -c 90

./check-azurerm-cores-ds-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                  -client_id "00000000-0000-0000-0000-000000000000"
                                  -client_secret "00000000-0000-0000-0000-000000000000"
                                  -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                  -location "westeurope"
                                  -warning_percentage 80
                                  -critical_percentage 90
```

**check-azurerm-cores-dsv2-usage.rb**
```
./check-azurerm-cores-dsv2-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-cores-dsv2-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                    -c "00000000-0000-0000-0000-000000000000"
                                    -S "00000000-0000-0000-0000-000000000000"
                                    -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                    -l "eastus2" -w 80 -c 90

./check-azurerm-cores-dsv2-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                    -client_id "00000000-0000-0000-0000-000000000000"
                                    -client_secret "00000000-0000-0000-0000-000000000000"
                                    -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                    -location "westeurope"
                                    -warning_percentage 80
                                    -critical_percentage 90
```

**check-azurerm-cores-dv2-usage.rb**
```
./check-azurerm-cores-dv2-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-cores-dv2-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                   -c "00000000-0000-0000-0000-000000000000"
                                   -S "00000000-0000-0000-0000-000000000000"
                                   -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                   -l "eastus2" -w 80 -c 90

./check-azurerm-cores-dv2-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                   -client_id "00000000-0000-0000-0000-000000000000"
                                   -client_secret "00000000-0000-0000-0000-000000000000"
                                   -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                   -location "westeurope"
                                   -warning_percentage 80
                                   -critical_percentage 90
```

**check-azurerm-cores-f-usage.rb**
```
./check-azurerm-cores-f-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-cores-f-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                 -c "00000000-0000-0000-0000-000000000000"
                                 -S "00000000-0000-0000-0000-000000000000"
                                 -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                 -l "eastus2" -w 80 -c 90

./check-azurerm-cores-f-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                 -client_id "00000000-0000-0000-0000-000000000000"
                                 -client_secret "00000000-0000-0000-0000-000000000000"
                                 -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                 -location "westeurope"
                                 -warning_percentage 80
                                 -critical_percentage 90
```

**check-azurerm-cores-fs-usage.rb**
```
./check-azurerm-cores-fs-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-cores-fs-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                  -c "00000000-0000-0000-0000-000000000000"
                                  -S "00000000-0000-0000-0000-000000000000"
                                  -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                  -l "eastus2" -w 80 -c 90

./check-azurerm-cores-fs-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                  -client_id "00000000-0000-0000-0000-000000000000"
                                  -client_secret "00000000-0000-0000-0000-000000000000"
                                  -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                  -location "westeurope"
                                  -warning_percentage 80
                                  -critical_percentage 90
```

**check-azurerm-load-balancers-usage.rb**
```
./check-azurerm-load-balancers-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-load-balancers-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                        -c "00000000-0000-0000-0000-000000000000"
                                        -S "00000000-0000-0000-0000-000000000000"
                                        -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                        -l "eastus2" -w 80 -c 90

./check-azurerm-load-balancers-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                        -client_id "00000000-0000-0000-0000-000000000000"
                                        -client_secret "00000000-0000-0000-0000-000000000000"
                                        -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                        -location "westeurope"
                                        -warning_percentage 80
                                        -critical_percentage 90
```

**check-azurerm-network-interfaces-usage.rb**
```
./check-azurerm-network-interfaces-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-network-interfaces-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                            -c "00000000-0000-0000-0000-000000000000"
                                            -S "00000000-0000-0000-0000-000000000000"
                                            -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                            -l "eastus2" -w 80 -c 90

./check-azurerm-network-interfaces-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                            -client_id "00000000-0000-0000-0000-000000000000"
                                            -client_secret "00000000-0000-0000-0000-000000000000"
                                            -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                            -location "westeurope"
                                            -warning_percentage 80
                                            -critical_percentage 90
```

**check-azurerm-network-security-groups-usage.rb**
```
./check-azurerm-network-security-groups-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-network-security-groups-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                                 -c "00000000-0000-0000-0000-000000000000"
                                                 -S "00000000-0000-0000-0000-000000000000"
                                                 -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                                 -l "eastus2" -w 80 -c 90

./check-azurerm-network-security-groups-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                                 -client_id "00000000-0000-0000-0000-000000000000"
                                                 -client_secret "00000000-0000-0000-0000-000000000000"
                                                 -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                                 -location "westeurope"
                                                 -warning_percentage 80
                                                 -critical_percentage 90
```

**check-azurerm-public-ip-addresses-usage.rb**
```
./check-azurerm-public-ip-addresses-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-public-ip-addresses-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                             -c "00000000-0000-0000-0000-000000000000"
                                             -S "00000000-0000-0000-0000-000000000000"
                                             -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                             -l "eastus2" -w 80 -c 90

./check-azurerm-public-ip-addresses-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                             -client_id "00000000-0000-0000-0000-000000000000"
                                             -client_secret "00000000-0000-0000-0000-000000000000"
                                             -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                             -location "westeurope"
                                             -warning_percentage 80
                                             -critical_percentage 90
```

**check-azurerm-static-public-ip-addresses-usage.rb**
```
./check-azurerm-static-public-ip-addresses-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-static-public-ip-addresses-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                                    -c "00000000-0000-0000-0000-000000000000"
                                                    -S "00000000-0000-0000-0000-000000000000"
                                                    -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                                    -l "eastus2" -w 80 -c 90

./check-azurerm-static-public-ip-addresses-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                                    -client_id "00000000-0000-0000-0000-000000000000"
                                                    -client_secret "00000000-0000-0000-0000-000000000000"
                                                    -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                                    -location "westeurope"
                                                    -warning_percentage 80
                                                    -critical_percentage 90
```

**check-azurerm-route-tables-usage.rb**
```
./check-azurerm-route-tables-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-route-tables-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                      -c "00000000-0000-0000-0000-000000000000"
                                      -S "00000000-0000-0000-0000-000000000000"
                                      -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                      -l "eastus2" -w 80 -c 90

./check-azurerm-route-tables-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                      -client_id "00000000-0000-0000-0000-000000000000"
                                      -client_secret "00000000-0000-0000-0000-000000000000"
                                      -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                      -location "westeurope"
                                      -warning_percentage 80
                                      -critical_percentage 90
```

**check-azurerm-service-bus-subscription.rb**
```
./check-azurerm-service-bus-subscription.rb
                           --resourceGroup "resourcegroup"
                           --namespace "namespace"
                           --topic "topic"
                           --subscriptionName "subscriptionName"

./check-azurerm-service-bus-subscription.rb
                           -t "00000000-0000-0000-0000-000000000000"
                           -c "00000000-0000-0000-0000-000000000000"
                           -S "00000000-0000-0000-0000-000000000000"
                           -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                           --resourceGroup "resourcegroup"
                           --namespace "namespace"
                           --topic "topic"
                           --subscriptionName "subscriptionName"
```

**check-azurerm-service-bus-topic-size.rb**
```
./check-azurerm-service-bus-topic-size.rb
                           --resourceGroup "resourcegroup"
                           --namespace "namespace"
                           --topic "topic"
                           -w 60
                           -c 80

./check-azurerm-service-bus-topic-size.rb
                           -t "00000000-0000-0000-0000-000000000000"
                           -c "00000000-0000-0000-0000-000000000000"
                           -S "00000000-0000-0000-0000-000000000000"
                           -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                           --resourceGroup "resourcegroup"
                           --namespace "namespace"
                           --topic "topic"
                           -w 60
                           -c 80
```

**check-azurerm-virtual-machines-usage.rb**
```
./check-azurerm-virtual-machines-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-virtual-machines-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                          -c "00000000-0000-0000-0000-000000000000"
                                          -S "00000000-0000-0000-0000-000000000000"
                                          -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                          -l "eastus2" -w 80 -c 90

./check-azurerm-virtual-machines-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                          -client_id "00000000-0000-0000-0000-000000000000"
                                          -client_secret "00000000-0000-0000-0000-000000000000"
                                          -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                          -location "westeurope"
                                          -warning_percentage 80
                                          -critical_percentage 90
```


**check-azurerm-virtual-network-gateway-connected.rb**
```
./check-azurerm-virtual-network-gateway-connected.rb -r "resourcegroup" -n "gatewayname"

./check-azurerm-virtual-network-gateway-connected.rb
                             -t "00000000-0000-0000-0000-000000000000"
                             -c "00000000-0000-0000-0000-000000000000"
                             -S "00000000-0000-0000-0000-000000000000"
                             -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                             -r "resourcegroup" -n "gatewayname"

./check-azurerm-virtual-network-gateway-connected.rb
                             -tenant "00000000-0000-0000-0000-000000000000"
                             -client "00000000-0000-0000-0000-000000000000"
                             -clientSecret "00000000-0000-0000-0000-000000000000"
                             -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                             -resourceGroup "resourcegroup"
                             -name "gatewayname"
```

**check-azurerm-virtual-network-gateway-failover-connected.rb**

```
./check-azurerm-virtual-network-gateway-failover-connected.rb
                           -r "resourcegroup"
                           -p "primaryname"
                           -s "secondaryname"

./check-azurerm-virtual-network-gateway-failover-connected.rb
                           -t "00000000-0000-0000-0000-000000000000"
                           -c "00000000-0000-0000-0000-000000000000"
                           -S "00000000-0000-0000-0000-000000000000"
                           -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                           -r "resourcegroup"
                           -p "primaryname"
                           -s "secondaryname"

./check-azurerm-virtual-network-gateway-failover-connected.rb
                          -tenant "00000000-0000-0000-0000-000000000000"
                          -client "00000000-0000-0000-0000-000000000000"
                          -clientSecret "00000000-0000-0000-0000-000000000000"
                          -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                          -resourceGroup "resourcegroup"
                          -primaryName "gatewayname"
                          -secondaryName "gatewayname"
```

**check-azurerm-virtual-networks-usage.rb**
```
./check-azurerm-virtual-networks-usage.rb -l "westeurope" -w 80 -c 90

./check-azurerm-virtual-networks-usage.rb -t "00000000-0000-0000-0000-000000000000"
                                          -c "00000000-0000-0000-0000-000000000000"
                                          -S "00000000-0000-0000-0000-000000000000"
                                          -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                          -l "eastus2" -w 80 -c 90

./check-azurerm-virtual-networks-usage.rb -tenant "00000000-0000-0000-0000-000000000000"
                                          -client_id "00000000-0000-0000-0000-000000000000"
                                          -client_secret "00000000-0000-0000-0000-000000000000"
                                          -subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                                          -location "westeurope"
                                          -warning_percentage 80
                                          -critical_percentage 90
```

**check-azurerm-monitor-metric.rb**
```
./check-azurerm-monitor-metric.rb --use-assigned-identity 
                                  --resource-id "id"
                                  --metric "metricname"
                                  --warning 80
                                  --critical 90

./check-azurerm-monitor-metric.rb --tenant "00000000-0000-0000-0000-000000000000" 
                                  --client "00000000-0000-0000-0000-000000000000"
                                  --clientSecret "00000000-0000-0000-0000-000000000000"
                                  --resource-id "id"
                                  --metric "metricname"
                                  --warning-under 80
                                  --critical-under 50

```

**metric-azurerm-service-bus-subscription-message-count.rb**
```
./metric-azurerm-service-bus-subscription-message-count.rb
                           --resourceGroup "resourcegroup"
                           --namespace "namespace"
                           --topic "topic"
                           --subscriptionName "subscriptionName"

./metric-azurerm-service-bus-subscription-message-count.rb
                           -t "00000000-0000-0000-0000-000000000000"
                           -c "00000000-0000-0000-0000-000000000000"
                           -S "00000000-0000-0000-0000-000000000000"
                           -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                           --resourceGroup "resourcegroup"
                           --namespace "namespace"
                           --topic "topic"
                           --subscriptionName "subscriptionName"

./metric-azurerm-service-bus-subscription-message-count.rb
                           --tenant "00000000-0000-0000-0000-000000000000"
                           --client "00000000-0000-0000-0000-000000000000"
                           --clientSecret "00000000-0000-0000-0000-000000000000"
                           --subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                           --resourceGroup "resourcegroup"
                           --namespaceName "namespace"
                           --topicName "topic"
                           --subscriptionName "subscriptionName"
                           --customScheme "foo"
```

**metric-azurerm-virtual-network-gateway-usagerb**
```
./metric-azurerm-virtual-network-gateway-usage.rb -r "resourcegroup" -n "gatewayname"

./metric-azurerm-virtual-network-gateway-usage.rb
                          -t "00000000-0000-0000-0000-000000000000"
                          -c "00000000-0000-0000-0000-000000000000"
                          -S "00000000-0000-0000-0000-000000000000"
                          -s "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                          -r "resourcegroup" -n "gatewayname"

./metric-azurerm-virtual-network-gateway-usage.rb
                          --tenant "00000000-0000-0000-0000-000000000000"
                          --client "00000000-0000-0000-0000-000000000000"
                          --clientSecret "00000000-0000-0000-0000-000000000000"
                          --subscription "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234"
                          --resourceGroup "resourcegroup"
                          --name "gatewayname"
                          --customScheme "foo"
```

## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)
