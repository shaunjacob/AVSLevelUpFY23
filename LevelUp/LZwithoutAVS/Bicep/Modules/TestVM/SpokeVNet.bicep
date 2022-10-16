
param Location string
param Prefix string
param NewSpokeVNetAddressSpace string
param SpokeSubnetPrefix string


var NewSpokeVNetName = '${Prefix}-spoke-vnet'

resource NewSpokeVNet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: NewSpokeVNetName
  location: Location
  properties: {
    addressSpace: {
      addressPrefixes: [
        NewSpokeVNetAddressSpace
      ]
    }
    subnets: [
      {
        name: 'SpokeSubnet'
        properties: {
          addressPrefix: SpokeSubnetPrefix
        }
      }
    ]
  }
}


output SpokeVNetName string = NewSpokeVNet.name
output SpokeVNetResourceId string = NewSpokeVNet.id
output SpokeSubnetid string = NewSpokeVNet.properties.subnets[0].id
