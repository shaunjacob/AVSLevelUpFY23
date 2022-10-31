#git clone https://github.com/shaunjacob/AVSLevelUpFY23
#terraform plan -var-file="lab12.tfvars"
#terraform apply -var-file="lab12.tfvars" -auto-approve

# VM configuration
vsphere_datacenter = "SDDC-Datacenter"
vsphere_server     = "10.12.0.2"
vsphere_user       = "cloudadmin@vsphere.local"
vsphere_password   = "fAh^369Kd6&f"
vm-name            = "levelup-vm"
datastore          = "vsanDatastore"
host               = "esx02-r18.p01.5d5552aa1b404e8c8fab5c.canadacentral.avs.azure.com"
network            = "VMSegment"