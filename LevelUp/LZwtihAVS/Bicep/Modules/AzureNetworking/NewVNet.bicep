
param Location string
param Prefix string
param NewHubVNetAddressSpace string
param GatewaySubnetPrefix string
param AzureFirewallSubnetPrefix string
param AzureBastionSubnetPrefix string
param RouteServerSubnetPrefix string
param ANFSubnetPrefix string
param JumpboxSubnetPrefix string
param NVASubnetPrefix string

var NewHubVNetName = '${Prefix}-hub-vnet'

//New VNet Workflow
resource NewHubVNet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: NewHubVNetName
  location: Location
  properties: {
    addressSpace: {
      addressPrefixes: [
        NewHubVNetAddressSpace
      ]
    }
    subnets: [
      {
        name: 'GatewaySubnet'
        properties: {
          addressPrefix: GatewaySubnetPrefix
        }
      }
      {
        name: 'AzureFirewallSubnet'
        properties: {
          addressPrefix: AzureFirewallSubnetPrefix
        }
      }
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: AzureBastionSubnetPrefix
        }
      }
      {
        name: 'RouteServerSubnet'
        properties: {
          addressPrefix: RouteServerSubnetPrefix
        }
      }
      {
        name: 'JumpboxSubnet'
        properties: {
          addressPrefix: JumpboxSubnetPrefix
        }
      }
      {
        name: 'ANFSubnet'
        properties: {
          addressPrefix: ANFSubnetPrefix
        }
      }
      {
        name: 'NVASubnet'
        properties: {
          addressPrefix: NVASubnetPrefix
        }
      }
    ]
  }
}

output GatewaySubnetid string = NewHubVNet.properties.subnets[0].id
output AzureFirewallSubnetid string = NewHubVNet.properties.subnets[1].id
output AzureBastionSubnetid string = NewHubVNet.properties.subnets[2].id
output RouteServerSubnetid string = NewHubVNet.properties.subnets[3].id
output JumpboxSubnetid string = NewHubVNet.properties.subnets[4].id
output ANFSubnetPrefixid string = NewHubVNet.properties.subnets[5].id
output NVASubnetid string = NewHubVNet.properties.subnets[6].id
output HubVNetName string = NewHubVNet.name
output HubVNetResourceId string = NewHubVNet.id

