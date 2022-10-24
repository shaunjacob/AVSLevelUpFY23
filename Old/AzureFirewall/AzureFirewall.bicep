@description('Location for all resources.')
param Location string = resourceGroup().location
param Prefix string
param AzureFirewallSubnetid string


var publicIpAddressName = '${Prefix}-AZFW-pip'
var firewallName = '${Prefix}-AZFW'


resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2022-01-01' = {
  name: publicIpAddressName
  location: Location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
  }
}

resource firewall 'Microsoft.Network/azureFirewalls@2022-01-01' = {
  name: firewallName
  location: Location
  properties: {
    sku: {
      name: 'AZFW_VNet'
      tier: 'Standard'
    }
    threatIntelMode: 'Alert'
    additionalProperties: {
      'Network.DNS.EnableProxy': 'true'
    }
    ipConfigurations: [
      {
        name: 'default'
        properties: {
          subnet: {
            id: AzureFirewallSubnetid
          }
          publicIPAddress: {
            id: publicIPAddress.id
          }
        }
      }
    ]
    networkRuleCollections: [
      {
        name: 'NetRule1'
        properties: {
          priority: 100
          action: {
            type: 'Allow'
          }
          rules: [
            {
              name: 'Any'
              protocols: [
                'Any'
              ]
              sourceAddresses: [
                '*'
              ]
              destinationAddresses: [
                '*'
              ]
              sourceIpGroups: []
              destinationIpGroups: []
              destinationFqdns: []
              destinationPorts: [
                '*'
              ]
            }
          ]
        }
      }
    ]
    applicationRuleCollections: [
        {
            name: 'AppRule1'
            properties: {
                priority: 100
                action: {
                    type: 'Allow'
                }
                rules: [
                    {
                        name: 'google'
                        protocols: [
                            {
                                protocolType: 'Http'
                                port: 80
                            }
                            {
                                protocolType: 'Https'
                                port: 443
                            }
                        ]
                        fqdnTags: []
                        targetFqdns: [
                            '*.google.com'
                        ]
                        sourceAddresses: [
                            '*'
                        ]
                        sourceIpGroups: []
                    }
                ]
            }
        }
    ]
    natRuleCollections: []
  }
}

resource AZFWRouteTable 'Microsoft.Network/routeTables@2022-05-01' = {
  name: 'ToAZFW-RouteTable'
  location: Location
  properties: {
    disableBgpRoutePropagation: true
    routes: [
      {
        name: 'ToAZFW'
        properties: {
          addressPrefix: '0.0.0.0/0'
          nextHopIpAddress: firewall.properties.ipConfigurations[0].properties.privateIPAddress
          nextHopType: 'VirtualAppliance'
        }
      }
    ]
  }
}

resource ToInternetRouteTable 'Microsoft.Network/routeTables@2022-05-01' = {
  name: 'ToInternet-RouteTable'
  location: Location
  properties: {
    disableBgpRoutePropagation: true
    routes: [
      {
        name: 'ToInternet'
        properties: {
          addressPrefix: '0.0.0.0/0'
          hasBgpOverride: false
          nextHopType: 'Internet'
        }
      }
    ]
  }
}

output AzureFirewallIP string = firewall.properties.ipConfigurations[0].properties.privateIPAddress
