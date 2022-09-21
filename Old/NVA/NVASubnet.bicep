param VNetName string
param NVASubnet string

resource VNet 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  name: VNetName
}

resource NVASubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  name: 'NVA'
  parent: VNet
  properties: {
    addressPrefix: NVASubnet
  }
}

output NVASubnetId string = NVASubnet.id
