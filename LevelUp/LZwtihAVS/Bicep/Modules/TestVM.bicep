targetScope = 'subscription'

param Location string
param Prefix string
param Username string
@secure()
param Password string
param NewSpokeVNetAddressSpace string
param SpokeSubnetPrefix string


resource NetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${Prefix}-SpokeNetwork'
  location: Location
}

module SpokeNetwork 'TestVM/SpokeVNet.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-NewNetwork'
  params: {
    Prefix: Prefix
    Location: Location
    NewSpokeVNetAddressSpace: NewSpokeVNetAddressSpace
    SpokeSubnetPrefix : SpokeSubnetPrefix
  }
}


module TestVM 'TestVM/TestVM.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-SpokeTestVM'
  params: {
    Prefix: Prefix
    Location: Location
    Username: Username
    Password : Password
    SpokeSubnetid : SpokeNetwork.outputs.SpokeSubnetid
  }
}

output SpokeNetworkResourceGroup string = NetworkResourceGroup.name
output SpokeVNetName string = SpokeNetwork.outputs.SpokeVNetName
output SpokeVNetResourceId string = SpokeNetwork.outputs.SpokeVNetResourceId
output SpokeSubnetid string = SpokeNetwork.outputs.SpokeSubnetid

