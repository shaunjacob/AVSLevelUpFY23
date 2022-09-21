
param Location string
param Prefix string
param NewVNetAddressSpace string
param GatewaySubnetPrefix string
param AzureFirewallSubnetPrefix string
param AzureBastionSubnetPrefix string
param RouteServerSubnetPrefix string
param TestVMSubnetPrefix string
param JumpboxSubnetPrefix string

var NewVNetName = '${Prefix}-vnet'

//New VNet Workflow
resource NewVNet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: NewVNetName
  location: Location
  properties: {
    addressSpace: {
      addressPrefixes: [
        NewVNetAddressSpace
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
        name: 'TestVMSubnet'
        properties: {
          addressPrefix: TestVMSubnetPrefix
        }
      }
    ]
  }
}

output GatewaySubnetid string = NewVNet.properties.subnets[0].id
output AzureFirewallSubnetid string = NewVNet.properties.subnets[1].id
output AzureBastionSubnetid string = NewVNet.properties.subnets[2].id
output RouteServerSubnetid string = NewVNet.properties.subnets[3].id
output JumpboxSubnetid string = NewVNet.properties.subnets[4].id
output TestVMSubnetid string = NewVNet.properties.subnets[5].id
output VNetName string = NewVNet.name
output VNetResourceId string = NewVNet.id
