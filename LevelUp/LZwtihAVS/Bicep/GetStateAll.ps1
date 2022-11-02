#CSV file picker module start
Function Get-FileName($initialDirectory)
{  
 [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
 Out-Null

 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = $initialDirectory
 $OpenFileDialog.filter = "All files (*.*)| *.*"
 $OpenFileDialog.ShowDialog() | Out-Null
 $OpenFileDialog.filename
} 
#CSV file picker module end


#Variable that holds CSV file location from file picker
$path = Get-FileName -initialDirectory "C:\Users\shaunjacob\OneDrive - Microsoft\AVS\Level Up" 


$Resources = import-csv $path 

$Resources | ForEach-Object { 

        Get-AzVMwarePrivateCloud -ResourceGroupName $_.PrivateCloudResourceGroup -name $_.PrivateCloudName | select-object name, ProvisioningState, AllowBranchToBranchTraffic, PeeringsText, DisableBgpRoutePropagation
        Get-AzVM -ResourceGroupName $_.HubResourceGroup -Name $_.JumpboxVM | select-object name, ProvisioningState, AllowBranchToBranchTraffic, PeeringsText, DisableBgpRoutePropagation
        Get-AzVM -ResourceGroupName $_.HubResourceGroup -Name $_.NVAVM | select-object name, ProvisioningState, AllowBranchToBranchTraffic, PeeringsText, DisableBgpRoutePropagation
        Get-AzFirewall -ResourceGroupName $_.HubResourceGroup -Name $_.AzureFirewall | select-object name, ProvisioningState, AllowBranchToBranchTraffic, PeeringsText, DisableBgpRoutePropagation
        Get-AzBastion -ResourceGroupName $_.HubResourceGroup -Name $_.Bastion | select-object name, ProvisioningState, AllowBranchToBranchTraffic, PeeringsText, DisableBgpRoutePropagation
        Get-AzRouteServer -ResourceGroupName $_.HubResourceGroup -RouteServerName $_.RouteServer | select-object name, ProvisioningState, AllowBranchToBranchTraffic, PeeringsText, DisableBgpRoutePropagation
        Get-AzVirtualNetworkGatewayConnection -ResourceGroupName $_.HubResourceGroup -Name $_.AVSConnection | select-object name, ProvisioningState, AllowBranchToBranchTraffic, PeeringsText, DisableBgpRoutePropagation
        Get-AzRouteTable -ResourceGroupName $_.HubResourceGroup -Name "ToInternet-RouteTable" | select-object name, ProvisioningState, AllowBranchToBranchTraffic, PeeringsText, DisableBgpRoutePropagations
        }