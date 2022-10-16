param Location string
param Prefix string
param RouteServerSubnetid string

var RouteServerName = '${Prefix}-RS'


resource RouteServerPIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: '${RouteServerName}-PIP'
  location: Location
  properties: {
    publicIPAllocationMethod: 'Static'
  }
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
}

resource RouteServer 'Microsoft.Network/virtualHubs@2021-05-01' = {
  name: RouteServerName
  location: Location
  properties: {
    allowBranchToBranchTraffic: true
    sku: 'Standard'
  }
}

resource RouteServerIPConfigurationNewSubnet 'Microsoft.Network/virtualHubs/ipConfigurations@2021-05-01' = {
  name: '${RouteServerName}-pipconfig'
  parent: RouteServer
  properties: {
    subnet: {
      id: RouteServerSubnetid
    }
    publicIPAddress: {
      id: RouteServerPIP.id
    }
  }
}

output RouteServer string = RouteServer.name
