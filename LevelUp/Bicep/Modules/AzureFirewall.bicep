targetScope = 'subscription'

param Location string
param Prefix string
param VNetName string
param AzureFirewallSubnetPrefix string
param Username string
@secure()
param Password string



resource NetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${Prefix}-Network'
  location: Location
}

module AzureFirewall 'AzureFirewall/AzureFirewall.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-TestVMSubnet'
  params: {
    Prefix: Prefix
    Location: Location
    VNetName: VNetName
    AzureFirewallSubnetPrefix : AzureFirewallSubnetPrefix
  }
}

module QuaggaVM 'AzureFirewall/Quagga.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-TestVMSubnet'
  params: {
    Prefix: Prefix
    Location: Location
    VNetName : VNetName
    Username: Username
    Password : Password
  }
}

output AzureFirewallIP string = AzureFirewall.outputs.AzureFirewallIP
