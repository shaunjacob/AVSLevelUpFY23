@description('Location for all resources.')
param Location string = resourceGroup().location
param Prefix string
param VNetName string
param AzureFirewallSubnetPrefix string


var publicIpAddressName = '${Prefix}-AZFW-pip'
var firewallName = '${Prefix}-AZFW'

resource VNet 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  name: VNetName
}

resource AzureFirewallSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  name: 'AzureFirewallSubnet'
  parent: VNet
  properties: {
    addressPrefix: AzureFirewallSubnetPrefix
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

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
            id: AzureFirewallSubnet.id
          }
          publicIPAddress: {
            id: publicIPAddress.id
          }
        }
      }
    ]
    networkRuleCollections: [
      {
        name: 'AVS'
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
            {
              name: 'google.com'
              protocols: [
                'TCP'
                'Any'
              ]
              sourceAddresses: [
                '*'
              ]
              destinationAddresses: []
              sourceIpGroups: []
              destinationIpGroups: []
              destinationFqdns: [
                'www.google.com'
              ]
              destinationPorts: [
                '*'
              ]
            }
          ]
        }
      }
    ]
    applicationRuleCollections: []
    natRuleCollections: []
  }
}

output AzureFirewallIP string = firewall.properties.hubIPAddresses.privateIPAddress
