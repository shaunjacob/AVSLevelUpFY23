param Prefix string
param Location string
param Username string
@secure()
param Password string
param NVASubnetid string
param vmSize string = 'Standard_B2s'

var Name = '${Prefix}-nva'
var Hostname = 'nva'
var networkSecurityGroupName = '${Prefix}-nva-nsg'
var osDiskType = 'Standard_LRS'


resource nic 'Microsoft.Network/networkInterfaces@2021-05-01' = {
  name: Name
  location: Location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: NVASubnetid
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2021-05-01' = {
  name: networkSecurityGroupName
  location: Location
  properties: {
    securityRules: [
      {
        name: 'SSH'
        properties: {
          priority: 1000
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
    ]
  }
}


resource frrvm 'Microsoft.Compute/virtualMachines@2021-11-01' = {
  name: Name
  location: Location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: osDiskType
        }
      }
      imageReference: {
        publisher: 'OpenLogic'
        offer: 'CentOS'
        sku: '8_5'
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
    osProfile: {
      computerName: Hostname
      adminUsername: Username
      adminPassword: Password
      linuxConfiguration: {
        patchSettings: {
          patchMode: 'ImageDefault'
        }
      }
    }
  }
}

output adminUsername string = Username
output frrResourceId string = frrvm.id
