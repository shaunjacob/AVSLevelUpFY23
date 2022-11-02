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

        $a = Get-AzVMwarePrivateCloud -ResourceGroupName $_.PrivateCloudResourceGroup -name $_.PrivateCloudName 
        $b = Get-AzVM -ResourceGroupName $_.HubResourceGroup -Name $_.JumpboxVM
        $c = Get-AzVM -ResourceGroupName $_.HubResourceGroup -Name $_.NVAVM
        $d = Get-AzFirewall -ResourceGroupName $_.HubResourceGroup -Name $_.AzureFirewall
        $e = Get-AzBastion -ResourceGroupName $_.HubResourceGroup -Name $_.Bastion
        $f = Get-AzRouteServer -ResourceGroupName $_.HubResourceGroup -RouteServerName $_.RouteServer
        $g = Get-AzVirtualNetworkGatewayConnection -ResourceGroupName $_.HubResourceGroup -Name $_.AVSConnection
        $h = Get-AzRouteTable -ResourceGroupName $_.HubResourceGroup -Name "ToInternet-RouteTable"

        new-object psobject -Property @{
            PrivateCloud = $a.name
            PCState = $a.ProvisioningState
            Jumpbox = $b.Name
            JumpboxState = $b.ProvisioningState
            NVA = $c.Name
            NVAState = $c.ProvisioningState
            Firewall = $d.Name
            FWState = $d.ProvisioningState
            Bastion = $e.Name
            BastionState = $e.ProvisioningState
            RouteServer = $f.Name
            RSState = $f.ProvisioningState
            RSBranchtoBranch = $f.AllowBranchToBranchTraffic
            Peerings = $f.PeeringsText
            GWConnection = $g.Name
            GWConnectionState = $g.ProvisioningState
            RouteTable = $h.Name
            RouteTableState = $h.ProvisioningState
            RouteTableBGP = $h.DisableBgpRoutePropagation
        } 
        } | Format-Table 'PrivateCloud', 'PCState', 'Jumpbox', 'JumpboxState', 'NVA', 'NVAState','Firewall', 'FWState','RouteServer', 'RSState', 'RSBranchtoBranch', 'Peerings', 'GWConnection', 'GWConnectionState', 'RouteTable', 'RouteTableState', 'RouteTableBGP'