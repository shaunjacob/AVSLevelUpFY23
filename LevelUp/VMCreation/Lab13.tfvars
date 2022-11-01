#git clone https://github.com/shaunjacob/AVSLevelUpFY23
#terraform plan -var-file="lab13.tfvars"
#terraform apply -var-file="lab13.tfvars" -auto-approve

# VM configuration
vsphere_datacenter = "SDDC-Datacenter"
vsphere_server     = "10.13.0.2"
vsphere_user       = "cloudadmin@vsphere.local"
vsphere_password   = "j9W1z@Aj^69z"
vm-name            = "levelup-vm"
datastore          = "vsanDatastore"
host               = "esx03-r20.p01.b142a255aaa5408bbe181e.canadacentral.avs.azure.com"
network            = "VMSegment"