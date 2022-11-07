@description('The location the new virtual network & gateway should reside in')
param Location string = resourceGroup().location
param Prefix string
param DeployCapacityPool bool

param netappCapacityPoolServiceLevel string = 'Standard'

@description('Size of the Azure NetApp Files datastore to be created')
param netappCapacityPoolSize int = 4398046511104


// param ANFSubnetPrefixid string

// @description('Name of the volume to be created for the Azure NetApp Files datastore')
// param netappVolumeName string

// @description('Size of the volume to be created for the Azure NetApp Files datastore')
// param netappVolumeSize int

var netappAccountName = '${Prefix}-ANF'
var netappCapacityPoolName = '${Prefix}-ANF-CP'

@description('create Azure NetApp Files account')
resource netappAccount 'Microsoft.NetApp/netAppAccounts@2022-01-01' = { 
    name: netappAccountName
    location: Location 
}

@description('create Azure NetApp Files capacity pool')
resource netappCapacityPool 'Microsoft.NetApp/netAppAccounts/capacityPools@2022-01-01' = if (DeployCapacityPool) {
    name: netappCapacityPoolName
    location: Location
    parent: netappAccount
    properties: {
        coolAccess: false
        qosType: 'Auto'
        serviceLevel: netappCapacityPoolServiceLevel
        size: netappCapacityPoolSize
    }
}

// @description('create Azure NetApp Files volume')
// resource netappVolume 'Microsoft.NetApp/netAppAccounts/capacityPools/volumes@2022-01-01' = {
//   name: netappVolumeName
//   location: Location
//   parent: netappCapacityPool
//   properties: {
//     avsDataStore: 'Enabled'
//     creationToken: netappVolumeName
//     exportPolicy: {
//       rules: [
//         {
//           allowedClients: '0.0.0.0/0'
//           chownMode: 'restricted'
//           cifs: false
//           hasRootAccess: true
//           nfsv3: true
//           nfsv41: false
//           ruleIndex: 1
//           unixReadWrite: true
//         }
//       ]
//     }
//     networkFeatures: 'Standard'
//     protocolTypes: ['NFSv3']
//     serviceLevel: netappCapacityPoolServiceLevel
//     subnetId: ANFSubnetPrefixid
//     usageThreshold: netappVolumeSize
//   }
// }

output ANFAccountName string = netappAccount.name
output ANFAccountid string = netappAccount.id
