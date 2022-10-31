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
param BootstrapJumpboxVM bool = false
param BootstrapPath string
param BootstrapCommand string


resource JumpboxResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' ={
  name: '${Prefix}-HubNetwork'
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
    BootstrapVM: BootstrapJumpboxVM
    BootstrapPath: BootstrapPath
    BootstrapCommand: BootstrapCommand
  }
}

output JumpboxResourceId string = VM.outputs.JumpboxResourceId
