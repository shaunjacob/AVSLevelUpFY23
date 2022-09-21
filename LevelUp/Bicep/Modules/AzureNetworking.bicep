targetScope = 'subscription'

param Location string
param Prefix string
param NewVNetAddressSpace string
param GatewaySubnetPrefix string
param AzureFirewallSubnetPrefix string
param AzureBastionSubnetPrefix string
param RouteServerSubnetPrefix string
param TestVMSubnetPrefix string
param JumpboxSubnetPrefix string

resource NetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${Prefix}-Network'
  location: Location
}

module NewNetwork 'AzureNetworking/NewVNet.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-NewNetwork'
  params: {
    Prefix: Prefix
    Location: Location
    NewVNetAddressSpace: NewVNetAddressSpace
    GatewaySubnetPrefix : GatewaySubnetPrefix
    AzureFirewallSubnetPrefix : AzureFirewallSubnetPrefix
    AzureBastionSubnetPrefix : AzureBastionSubnetPrefix
    RouteServerSubnetPrefix : RouteServerSubnetPrefix
    TestVMSubnetPrefix : TestVMSubnetPrefix
    JumpboxSubnetPrefix : JumpboxSubnetPrefix
  }
}

module Gateway 'AzureNetworking/Gateway.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-NewNetwork'
  params: {
    Prefix: Prefix
    Location: Location
    GatewaySubnet : NewNetwork.outputs.GatewaySubnetid
  }
}

output GatewayName string = Gateway.outputs.GatewayName
output VNetName string = NewNetwork.outputs.VNetName
output VNetResourceId string = NewNetwork.outputs.VNetResourceId
output NetworkResourceGroup string = NetworkResourceGroup.name
output GatewaySubnetid string = NewNetwork.outputs.GatewaySubnetid
output AzureFirewallSubnetid string = NewNetwork.outputs.AzureFirewallSubnetid
output AzureBastionSubnetid string = NewNetwork.outputs.AzureBastionSubnetid
output RouteServerSubnetid string = NewNetwork.outputs.RouteServerSubnetid
output JumpboxSubnetid string = NewNetwork.outputs.JumpboxSubnetid
output TestVMSubnetid string = NewNetwork.outputs.TestVMSubnetid
