param Location string
param Prefix string
param GatewaySubnet string
param NewGatewaySku string = 'Standard'

var NewVnetNewGatewayName = '${Prefix}-gw'


resource NewGatewayPIP 'Microsoft.Network/publicIPAddresses@2021-08-01' = {
  name: '${NewVnetNewGatewayName}-pip'
  location: Location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
  sku: {
    name: 'Basic'
    tier: 'Regional'
  }
}

//New Gateway Workflow
resource NewVnetNewGateway 'Microsoft.Network/virtualNetworkGateways@2021-08-01' = {
  name: NewVnetNewGatewayName
  location: Location
  properties: {
    gatewayType: 'ExpressRoute'
    sku: {
      name: NewGatewaySku
      tier: NewGatewaySku
    }
    ipConfigurations: [
      {
        name: 'default'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: GatewaySubnet
          }
          publicIPAddress: {
            id: NewGatewayPIP.id
          }
        }
      }
    ]
  }
}

output GatewayName string = NewVnetNewGateway.name
