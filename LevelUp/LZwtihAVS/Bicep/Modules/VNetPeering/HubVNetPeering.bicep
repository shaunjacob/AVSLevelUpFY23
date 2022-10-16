
param SpokeVNetAddressSpaceid string = '/subscriptions/1caa5ab4-523f-4851-952b-1b689c48fae9/resourceGroups/SJLUPTEST2-Network/providers/Microsoft.Network/virtualNetworks/SJLUPTEST2-spoke-vnet'
param HubVnetName string

resource HubtoSpokePeer 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-05-01' = {
  name: '${HubVnetName}/peering-to-spoke-vnet'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: true
    remoteVirtualNetwork: {
      id: SpokeVNetAddressSpaceid
    }
    useRemoteGateways: false
  }
}
