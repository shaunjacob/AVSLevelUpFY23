az network routeserver peering list-learned-routes --resource-group SJLUPTEST2-network --routeserver RouteServer --name NVA1


$routes = @{RouteServerName = 'SJLUPTEST2-RS'
ResourceGroupName = 'SJLUPTEST2-network'
PeerName = 'frr'}



Get-AzRouteServerPeerLearnedRoute @routes | ft


az network routeserver peering list --resource-group SJLUPTEST2-network --routeserver SJLUPTEST2-RS --query "[].id" -o tsv

az network routeserver update --name fw-ars --resource-group $fwRgName --allow-b2b-traffic



$routeserver = @{
    RouteServerName = 'SJLUPTEST2-RS'
    ResourceGroupName = 'SJLUPTEST2-network'
    AllowBranchToBranchTraffic = $true
}  
Update-AzRouteServer @routeserver