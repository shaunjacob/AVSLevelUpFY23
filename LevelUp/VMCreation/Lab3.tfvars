#git clone https://github.com/shaunjacob/AVSLevelUpFY23
#terraform plan -var-file="lab2.tfvars"
#terraform apply -var-file="lab2.tfvars" -auto-approve

# VM configuration
vsphere_datacenter = "SDDC-Datacenter"
vsphere_server     = "10.3.0.2"
vsphere_user       = "cloudadmin@vsphere.local"
vsphere_password   = "^67qwKtI43k*"
vm-name            = "levelup-vm"
datastore          = "vsanDatastore"
host               = "esx04-r04.p01.c7b6346ff1c9489f930383.canadacentral.avs.azure.com"
network            = "VMSegment"