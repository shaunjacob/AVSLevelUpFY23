
param HubVNetAddressSpaceid string = '/subscriptions/1caa5ab4-523f-4851-952b-1b689c48fae9/resourceGroups/SJLUPTEST2-Network/providers/Microsoft.Network/virtualNetworks/SJLUPTEST2-hub-vnet'
param SpokeVNetName string

resource SpoketoHubPeer 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-05-01' = {
  name: '${SpokeVNetName}/peering-to-hub-vnet'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    remoteVirtualNetwork: {
      id: HubVNetAddressSpaceid
    }
    useRemoteGateways: true
  }
}
