param Prefix string
param Location string
param Username string
@secure()
param Password string
param JumpboxSubnetid string
param vmSize string = 'Standard_B2s'

var Name = '${Prefix}-frr'
var Hostname = 'frr'
var publicIPAddressName = '${Prefix}-frr-pip'
var networkSecurityGroupName = '${Prefix}-frr-nsg'
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
            id: JumpboxSubnetid
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIP.id
          }
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


resource publicIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: publicIPAddressName
  location: Location
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    publicIPAddressVersion: 'IPv4'
    idleTimeoutInMinutes: 4
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
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
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
