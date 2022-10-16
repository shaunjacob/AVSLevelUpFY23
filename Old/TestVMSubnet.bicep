param Prefix string
param VNetName string
param TestVMSubnetPrefix string
param Location string = resourceGroup().location
param AzureFirewallIP string

resource VNet 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  name: VNetName
}

resource routeTable 'Microsoft.Network/routeTables@2021-02-01' = {
  name: '${Prefix}-TestSubnet-rt'
  location: Location
  properties: {
    disableBgpRoutePropagation: true
    routes: [{     
      name: 'ToAZFW'
      properties: {
        addressPrefix: '0.0.0.0/0'
        hasBgpOverride: false
        nextHopIpAddress: AzureFirewallIP
        nextHopType: 'VirtualAppliance'
      }
    }]
  }
}

resource TestVNetSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01'  = {
  name: 'TestVMSubnet'
  parent: VNet
  properties: {
    addressPrefix: TestVMSubnetPrefix
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
    routeTable: {
      id: routeTable.id
    }
  }
}

output RouteTableName string = routeTable.name
output RouteTableid string = routeTable.id
