targetScope = 'subscription'

param Prefix string
param Location string
@secure()
param Username string
@secure()
param Password string
param JumpboxSku string
param JumpboxSubnetid string
param AzureBastionSubnetid string


resource JumpboxResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' ={
  name: '${Prefix}-Jumpbox'
  location: Location
}

module Bastion 'JumpBox/Bastion.bicep' = {
  name: '${deployment().name}-Bastion'
  scope: JumpboxResourceGroup
  params:{
    Prefix: Prefix
    AzureBastionSubnetid: AzureBastionSubnetid
    Location: Location
  }
}

module VM 'JumpBox/JumpBoxVM.bicep' = {
  name: '${deployment().name}-VM'
  scope: JumpboxResourceGroup
  params: {
    Prefix: Prefix
    JumpboxSubnetid: JumpboxSubnetid
    Location: Location
    Username: Username
    Password: Password
    VMSize: JumpboxSku
  }
}

output JumpboxResourceId string = VM.outputs.JumpboxResourceId
