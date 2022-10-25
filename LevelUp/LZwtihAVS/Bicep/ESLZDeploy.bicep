targetScope = 'subscription'

@description('The prefix to use on resources inside this template')
@minLength(1)
@maxLength(20)
param Prefix string = 'SJLUPTEST1'
@description('Optional: The location the private cloud should be deployed to, by default this will be the location of the deployment')
param Location string = deployment().location

//Private Cloud
@description('The address space used for the AVS Private Cloud management networks. Must be a non-overlapping /22')
param PrivateCloudAddressSpace string
@description('The SKU that should be used for the first cluster, ensure you have quota for the given SKU before deploying')
@allowed([
  'AV36'
  'AV36T'
])
param PrivateCloudSKU string = 'AV36'
@description('The number of nodes to be deployed in the first/default cluster, ensure you have quota before deploying')
param PrivateCloudHostCount int = 3

//Azure Networking
param NewHubVNetAddressSpace string = '10.101.0.0/16'
param GatewaySubnetPrefix string = '10.101.1.0/24'
param AzureFirewallSubnetPrefix string = '10.101.4.0/24'
param AzureBastionSubnetPrefix string = '10.101.2.0/24'
param RouteServerSubnetPrefix string = '10.101.3.0/24'
param ANFSubnetPrefix string = '10.101.6.0/24'
param JumpboxSubnetPrefix string = '10.101.5.0/24'
param NVASubnetPrefix string = '10.101.6.0/24'
param NewSpokeVNetAddressSpace string = '10.201.1.0/24'
param SpokeSubnetPrefix string = '10.201.1.0/27'


//Jumpbox
param Username string = 'avsjump'
@secure()
param Password string = ''
param JumpboxSku string = 'Standard_B2s'

//Variables
var deploymentPrefix = 'AVS-${uniqueString(deployment().name, Location)}'

module AVSCore 'Modules/AVSCore.bicep' = {
  name: '${deploymentPrefix}-AVS'
  params: {
    Prefix: Prefix
    Location: Location
    PrivateCloudAddressSpace: PrivateCloudAddressSpace
    PrivateCloudHostCount: PrivateCloudHostCount
    PrivateCloudSKU: PrivateCloudSKU
  }
}

module VNetConnection 'Modules/VNetConnection.bicep' = {
  name: '${deploymentPrefix}-VNet'
  params: {
    GatewayName: AzureNetworking.outputs.GatewayName
    NetworkResourceGroup: AzureNetworking.outputs.HubNetworkResourceGroup
    VNetPrefix: Prefix
    PrivateCloudName: AVSCore.outputs.PrivateCloudName
    PrivateCloudResourceGroup: AVSCore.outputs.PrivateCloudResourceGroupName
    Location: Location
  }
}

module AzureNetworking 'Modules/AzureNetworking.bicep' = {
  name: '${deploymentPrefix}-AzureNetworking'
  params: {
    Prefix: Prefix
    Location: Location
    NewHubVNetAddressSpace: NewHubVNetAddressSpace
    GatewaySubnetPrefix : GatewaySubnetPrefix
    AzureFirewallSubnetPrefix : AzureFirewallSubnetPrefix
    AzureBastionSubnetPrefix : AzureBastionSubnetPrefix
    RouteServerSubnetPrefix : RouteServerSubnetPrefix
    ANFSubnetPrefix : ANFSubnetPrefix
    JumpboxSubnetPrefix : JumpboxSubnetPrefix
    NVASubnetPrefix : NVASubnetPrefix
  }
}

module RouteServer 'Modules/RouteServer.bicep' = {
  name: '${deploymentPrefix}-RouteServer'
  params: {
    Prefix: Prefix
    Location: Location
    RouteServerSubnetid : AzureNetworking.outputs.RouteServerSubnetid
  }
}

module Jumpbox 'Modules/JumpBox.bicep' = {
  name: '${deploymentPrefix}-Jumpbox'
  params: {
    Prefix: Prefix
    Location: Location
    Username: Username
    Password: Password
    AzureBastionSubnetid : AzureNetworking.outputs.AzureBastionSubnetid
    JumpboxSubnetid : AzureNetworking.outputs.JumpboxSubnetid
    JumpboxSku: JumpboxSku
  }
}

module AzureFirewall 'Modules/AzureFirewall.bicep' = {
  name: '${deploymentPrefix}-AzureFirewall'
  params: {
    Prefix: Prefix
    Location: Location
    Username: Username
    Password: Password
    AzureFirewallSubnetid : AzureNetworking.outputs.AzureFirewallSubnetid
    NVASubnetid : AzureNetworking.outputs.NVASubnetid
  }
}

module TestVM 'Modules/TestVM.bicep' = {
  name: '${deploymentPrefix}-SpokeTestVM'
  params: {
    Prefix: Prefix
    Location: Location
    Username: Username
    Password: Password
    NewSpokeVNetAddressSpace : NewSpokeVNetAddressSpace
    SpokeSubnetPrefix : SpokeSubnetPrefix
  }
}

module VNetPeering 'Modules/VNetPeering.bicep' = {
  name: '${deploymentPrefix}-VNetPeering'
  params: {
    Location: Location
    HubNetworkResourceGroupName: AzureNetworking.outputs.HubNetworkResourceGroup
    HubVNetAddressSpaceid: AzureNetworking.outputs.HubVNetResourceId
    SpokeNetworkResourceGroupName : TestVM.outputs.SpokeNetworkResourceGroup
    SpokeVNetAddressSpaceid : TestVM.outputs.SpokeVNetResourceId
    HubVnetName : AzureNetworking.outputs.HubVNetName
    SpokeVNetName : TestVM.outputs.SpokeVNetName
  }
}
