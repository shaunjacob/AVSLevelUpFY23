param Prefix string
param Location string
param Username string
@secure()
param Password string
param VMSize string = 'Standard_B2s'
param SpokeSubnetid string

var Name = '${Prefix}-SpokeVM'
var Hostname = 'avsspokevm'


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
            id: SpokeSubnetid
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
        sku: 'win11-21h2-avd'
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

output TestVMName string = VM.name
output TestVMResourceId string = VM.id
