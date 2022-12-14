param Prefix string
param JumpboxSubnetid string
param Location string
param Username string
@secure()
param Password string
param VMSize string
param OSVersion string = 'win11-21h2-avd'
param BootstrapVM bool = false
param BootstrapPath string = ''
param BootstrapCommand string = ''


var Name = '${Prefix}-jumpbox'
var Hostname = 'avsjumpbox'

resource Nic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name: Name
  location: Location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: JumpboxSubnetid
          }
        }
      }
    ]
  }
}

resource VM 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: Name
  location: Location
  properties: {
    hardwareProfile: {
      vmSize: VMSize
    }
    osProfile: {
      computerName: Hostname
      adminUsername: Username
      adminPassword: Password
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsDesktop'
        offer: 'Windows-11'
        sku: OSVersion
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: Nic.id
        }
      ]
    }
  }
}

resource Bootstrap 'Microsoft.Compute/virtualMachines/extensions@2015-06-15' = if(BootstrapVM) {
  name: '${VM.name}/CustomScriptExtension'
  location: Location
  properties: {
    publisher: 'Microsoft.Compute'
    type: 'CustomScriptExtension'
    typeHandlerVersion: '1.9'
    autoUpgradeMinorVersion: true
    settings: {
      fileUris: [
        BootstrapPath
      ]
      commandToExecute: BootstrapCommand
    }
  }
}

output JumpboxResourceId string = VM.id
