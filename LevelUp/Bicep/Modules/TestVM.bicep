targetScope = 'subscription'

param Location string
param Prefix string
param Username string
@secure()
param Password string
param TestVNetSubnetid string

resource NetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${Prefix}-Network'
  location: Location
}


module TestVM 'TestVM/TestVM.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-TestVMSubnet'
  params: {
    Prefix: Prefix
    Location: Location
    Username: Username
    Password : Password
    TestVNetSubnetid : TestVNetSubnetid
  }
}
