targetScope = 'subscription'

param Location string
param Prefix string
param DeployCapacityPool bool

resource NetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${Prefix}-HubNetwork'
  location: Location
}

module ANF 'ANF/ANF.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-ANF'
  params: {
    Location: Location
    Prefix : Prefix
    DeployCapacityPool: DeployCapacityPool
  }
}

output ANFAccountName string = ANF.outputs.ANFAccountName
