targetScope = 'subscription'

param Location string
param Prefix string
param NewHubVNetAddressSpace string
param GatewaySubnetPrefix string
param AzureFirewallSubnetPrefix string
param AzureBastionSubnetPrefix string
param RouteServerSubnetPrefix string
param ANFSubnetPrefix string
param JumpboxSubnetPrefix string

resource NetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${Prefix}-HubNetwork'
  location: Location
}

module NewNetwork 'AzureNetworking/NewVNet.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-NewNetwork'
  params: {
    Prefix: Prefix
    Location: Location
    NewHubVNetAddressSpace: NewHubVNetAddressSpace
    GatewaySubnetPrefix : GatewaySubnetPrefix
    AzureFirewallSubnetPrefix : AzureFirewallSubnetPrefix
    AzureBastionSubnetPrefix : AzureBastionSubnetPrefix
    RouteServerSubnetPrefix : RouteServerSubnetPrefix
    ANFSubnetPrefix : ANFSubnetPrefix
    JumpboxSubnetPrefix : JumpboxSubnetPrefix
  }
}

module Gateway 'AzureNetworking/Gateway.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-Gateway'
  params: {
    Prefix: Prefix
    Location: Location
    GatewaySubnet : NewNetwork.outputs.GatewaySubnetid
  }
}

output GatewayName string = Gateway.outputs.GatewayName
output HubVNetName string = NewNetwork.outputs.HubVNetName
output HubVNetResourceId string = NewNetwork.outputs.HubVNetResourceId
output HubNetworkResourceGroup string = NetworkResourceGroup.name
output GatewaySubnetid string = NewNetwork.outputs.GatewaySubnetid
output AzureFirewallSubnetid string = NewNetwork.outputs.AzureFirewallSubnetid
output AzureBastionSubnetid string = NewNetwork.outputs.AzureBastionSubnetid
output RouteServerSubnetid string = NewNetwork.outputs.RouteServerSubnetid
output JumpboxSubnetid string = NewNetwork.outputs.JumpboxSubnetid
output ANFSubnetPrefixid string = NewNetwork.outputs.ANFSubnetPrefixid

