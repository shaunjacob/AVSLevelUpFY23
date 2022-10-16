targetScope = 'subscription'

param Location string
param HubNetworkResourceGroupName string
param HubVNetAddressSpaceid string
param SpokeNetworkResourceGroupName string
param SpokeVNetAddressSpaceid string
param HubVnetName string
param SpokeVNetName string


resource HubNetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: HubNetworkResourceGroupName
  location: Location
}

resource SpokeNetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: SpokeNetworkResourceGroupName
  location: Location
}

module HubVNetPeering 'VNetPeering/HubVNetPeering.bicep' = {
  scope: HubNetworkResourceGroup
  name: '${deployment().name}-HubVNetPeering'
  params: {
    SpokeVNetAddressSpaceid : SpokeVNetAddressSpaceid
    HubVnetName : HubVnetName
  }
}

module SpokeVNetPeering 'VNetPeering/SpokeVNetPeering.bicep' = {
  scope: SpokeNetworkResourceGroup
  name: '${deployment().name}-SpokeVNetPeering'
  params: {
    HubVNetAddressSpaceid : HubVNetAddressSpaceid
    SpokeVNetName : SpokeVNetName
  }
}
