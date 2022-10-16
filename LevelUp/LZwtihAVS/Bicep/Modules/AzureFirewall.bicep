targetScope = 'subscription'

param Location string
param Prefix string
param AzureFirewallSubnetid string
param JumpboxSubnetid string
param Username string
@secure()
param Password string



resource NetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${Prefix}-HubNetwork'
  location: Location
}

module AzureFirewall 'AzureFirewall/AzureFirewall.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-AzureFirewall'
  params: {
    Prefix: Prefix
    Location: Location
    AzureFirewallSubnetid : AzureFirewallSubnetid
  }
}

module FRRVM 'AzureFirewall/FRR.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-FRRVM'
  params: {
    Prefix: Prefix
    Location: Location
    Username: Username
    Password : Password
    JumpboxSubnetid : JumpboxSubnetid
  }
}

output AzureFirewallIP string = AzureFirewall.outputs.AzureFirewallIP
