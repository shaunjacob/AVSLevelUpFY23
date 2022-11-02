#Lab1
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB1-HubNetwork" -Name "LEVELUP-LAB1-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB1-HubNetwork" -Name "LEVELUP-LAB1-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB1-HubNetwork" -Name LEVELUP-LAB1-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB1-HubNetwork" -RouteServerName "LEVELUP-LAB1-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB1-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#Lab2
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB2-HubNetwork" -Name "LEVELUP-LAB2-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB2-HubNetwork" -Name "LEVELUP-LAB2-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB2-HubNetwork" -Name LEVELUP-LAB2-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB2-HubNetwork" -RouteServerName "LEVELUP-LAB2-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB2-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob


#LAB3
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB3-HubNetwork" -Name "LEVELUP-LAB3-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB3-HubNetwork" -Name "LEVELUP-LAB3-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB3-HubNetwork" -Name LEVELUP-LAB3-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB3-HubNetwork" -RouteServerName "LEVELUP-LAB3-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB3-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB4
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB4-HubNetwork" -Name "LEVELUP-LAB4-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB4-HubNetwork" -Name "LEVELUP-LAB4-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB4-HubNetwork" -Name LEVELUP-LAB4-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB4-HubNetwork" -RouteServerName "LEVELUP-LAB4-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB4-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB5
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB5-HubNetwork" -Name "LEVELUP-LAB5-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB5-HubNetwork" -Name "LEVELUP-LAB5-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB5-HubNetwork" -Name LEVELUP-LAB5-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB5-HubNetwork" -RouteServerName "LEVELUP-LAB5-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB5-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB22
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB6-HubNetwork" -Name "LEVELUP-LAB6-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB6-HubNetwork" -Name "LEVELUP-LAB6-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB6-HubNetwork" -Name LEVELUP-LAB6-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB6-HubNetwork" -RouteServerName "LEVELUP-LAB6-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB6-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB7
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB7-HubNetwork" -Name "LEVELUP-LAB7-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB7-HubNetwork" -Name "LEVELUP-LAB7-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB7-HubNetwork" -Name LEVELUP-LAB7-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB7-HubNetwork" -RouteServerName "LEVELUP-LAB7-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB7-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB8
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB8-HubNetwork" -Name "LEVELUP-LAB8-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB8-HubNetwork" -Name "LEVELUP-LAB8-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB8-HubNetwork" -Name LEVELUP-LAB8-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB8-HubNetwork" -RouteServerName "LEVELUP-LAB8-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB8-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB9
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB9-HubNetwork" -Name "LEVELUP-LAB9-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB9-HubNetwork" -Name "LEVELUP-LAB9-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB9-HubNetwork" -Name LEVELUP-LAB9-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB9-HubNetwork" -RouteServerName "LEVELUP-LAB9-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB9-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB10
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB10-HubNetwork" -Name "LEVELUP-LAB10-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB10-HubNetwork" -Name "LEVELUP-LAB10-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB10-HubNetwork" -Name LEVELUP-LAB10-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB10-HubNetwork" -RouteServerName "LEVELUP-LAB10-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB10-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB11
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB11-HubNetwork" -Name "LEVELUP-LAB11-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB11-HubNetwork" -Name "LEVELUP-LAB11-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB11-HubNetwork" -Name LEVELUP-LAB11-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB11-HubNetwork" -RouteServerName "LEVELUP-LAB11-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB11-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB12
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB12-HubNetwork" -Name "LEVELUP-LAB12-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB12-HubNetwork" -Name "LEVELUP-LAB12-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB12-HubNetwork" -Name LEVELUP-LAB12-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB12-HubNetwork" -RouteServerName "LEVELUP-LAB12-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB12-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB13
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB13-HubNetwork" -Name "LEVELUP-LAB13-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB13-HubNetwork" -Name "LEVELUP-LAB13-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB13-HubNetwork" -Name LEVELUP-LAB13-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB13-HubNetwork" -RouteServerName "LEVELUP-LAB13-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB13-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB14
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB14-HubNetwork" -Name "LEVELUP-LAB14-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB14-HubNetwork" -Name "LEVELUP-LAB14-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB14-HubNetwork" -Name LEVELUP-LAB14-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB14-HubNetwork" -RouteServerName "LEVELUP-LAB14-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB14-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB15
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB15-HubNetwork" -Name "LEVELUP-LAB15-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB15-HubNetwork" -Name "LEVELUP-LAB15-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB15-HubNetwork" -Name LEVELUP-LAB15-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB15-HubNetwork" -RouteServerName "LEVELUP-LAB15-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB15-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB16
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB16-HubNetwork" -Name "LEVELUP-LAB16-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB16-HubNetwork" -Name "LEVELUP-LAB16-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB16-HubNetwork" -Name LEVELUP-LAB16-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB16-HubNetwork" -RouteServerName "LEVELUP-LAB16-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB16-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB17
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB17-HubNetwork" -Name "LEVELUP-LAB17-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB17-HubNetwork" -Name "LEVELUP-LAB17-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB17-HubNetwork" -Name LEVELUP-LAB17-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB17-HubNetwork" -RouteServerName "LEVELUP-LAB17-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB17-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB18
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB18-HubNetwork" -Name "LEVELUP-LAB18-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB18-HubNetwork" -Name "LEVELUP-LAB18-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB18-HubNetwork" -Name LEVELUP-LAB18-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB18-HubNetwork" -RouteServerName "LEVELUP-LAB18-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB18-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB19
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB19-HubNetwork" -Name "LEVELUP-LAB19-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB19-HubNetwork" -Name "LEVELUP-LAB19-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB19-HubNetwork" -Name LEVELUP-LAB19-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB19-HubNetwork" -RouteServerName "LEVELUP-LAB19-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB19-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB20
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB20-HubNetwork" -Name "LEVELUP-LAB20-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB20-HubNetwork" -Name "LEVELUP-LAB20-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB20-HubNetwork" -Name LEVELUP-LAB20-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB20-HubNetwork" -RouteServerName "LEVELUP-LAB20-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB20-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB21
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB21-HubNetwork" -Name "LEVELUP-LAB21-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB21-HubNetwork" -Name "LEVELUP-LAB21-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB21-HubNetwork" -Name LEVELUP-LAB21-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB21-HubNetwork" -RouteServerName "LEVELUP-LAB21-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB21-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB22
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB22-HubNetwork" -Name "LEVELUP-LAB22-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB22-HubNetwork" -Name "LEVELUP-LAB22-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB22-HubNetwork" -Name LEVELUP-LAB22-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB22-HubNetwork" -RouteServerName "LEVELUP-LAB22-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB22-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB23
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB23-HubNetwork" -Name "LEVELUP-LAB23-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB23-HubNetwork" -Name "LEVELUP-LAB23-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB23-HubNetwork" -Name LEVELUP-LAB23-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB23-HubNetwork" -RouteServerName "LEVELUP-LAB23-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB23-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB24
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB24-HubNetwork" -Name "LEVELUP-LAB24-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB24-HubNetwork" -Name "LEVELUP-LAB24-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB24-HubNetwork" -Name LEVELUP-LAB24-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB24-HubNetwork" -RouteServerName "LEVELUP-LAB24-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB24-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB25
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB25-HubNetwork" -Name "LEVELUP-LAB25-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB25-HubNetwork" -Name "LEVELUP-LAB25-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB25-HubNetwork" -Name LEVELUP-LAB25-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB25-HubNetwork" -RouteServerName "LEVELUP-LAB25-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB25-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB26
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB26-HubNetwork" -Name "LEVELUP-LAB26-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB26-HubNetwork" -Name "LEVELUP-LAB26-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB26-HubNetwork" -Name LEVELUP-LAB26-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB26-HubNetwork" -RouteServerName "LEVELUP-LAB26-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB26-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB27
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB27-HubNetwork" -Name "LEVELUP-LAB27-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB27-HubNetwork" -Name "LEVELUP-LAB27-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB27-HubNetwork" -Name LEVELUP-LAB27-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB27-HubNetwork" -RouteServerName "LEVELUP-LAB27-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB27-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB28
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB28-HubNetwork" -Name "LEVELUP-LAB28-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB28-HubNetwork" -Name "LEVELUP-LAB28-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB28-HubNetwork" -Name LEVELUP-LAB28-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB28-HubNetwork" -RouteServerName "LEVELUP-LAB28-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB28-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

#LAB29
Remove-AzFirewall -ResourceGroupName "LEVELUP-LAB29-HubNetwork" -Name "LEVELUP-LAB29-AZFW" -Force -AsJob
Remove-AzVM -ResourceGroupName "LEVELUP-LAB29-HubNetwork" -Name "LEVELUP-LAB29-nva" -force -Asjob
Get-AzDisk -ResourceGroupName "LEVELUP-LAB29-HubNetwork" -Name LEVELUP-LAB29-nva* | Remove-AzDisk -Force -AsJob
Remove-AzRouteServer -ResourceGroupName "LEVELUP-LAB29-HubNetwork" -RouteServerName "LEVELUP-LAB29-RS" -force -asjob
Remove-AzRouteTable -ResourceGroupName "LEVELUP-LAB29-HubNetwork" -Name "ToAZFW-RouteTable" -force -asjob

