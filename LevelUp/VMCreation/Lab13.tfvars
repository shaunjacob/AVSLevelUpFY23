#git clone https://github.com/shaunjacob/AVSLevelUpFY23
#terraform plan -var-file="lab13.tfvars"
#terraform apply -var-file="lab13.tfvars" -auto-approve

# VM configuration
vsphere_datacenter = "SDDC-Datacenter"
vsphere_server     = "10.13.0.2"
vsphere_user       = "cloudadmin@vsphere.local"
vsphere_password   = "fAh^369Kd6&f"
vm-name            = "levelup-vm"
datastore          = "vsanDatastore"
host               = "esx18-r09.p01.96d0ec360a54498bac0ff3.canadacentral.avs.azure.com"
network            = "VMSegment"