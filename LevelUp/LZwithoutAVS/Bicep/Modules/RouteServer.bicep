targetScope = 'subscription'

param Location string
param Prefix string
param RouteServerSubnetid string

resource NetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${Prefix}-HubNetwork'
  location: Location
}

module RouteServer 'RouteServer/RouteServer.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-Network'
  params: {
    Prefix: Prefix
    Location: Location
    RouteServerSubnetid : RouteServerSubnetid
  }
}

output RouteServer string = RouteServer.outputs.RouteServer
