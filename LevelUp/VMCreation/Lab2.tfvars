#git clone https://github.com/shaunjacob/AVSLevelUpFY23
#terraform plan -var-file="lab2.tfvars"
#terraform apply -var-file="lab2.tfvars" -auto-approve

# VM configuration
vsphere_datacenter = "SDDC-Datacenter"
vsphere_server     = "10.2.0.2"
vsphere_user       = "cloudadmin@vsphere.local"
vsphere_password   = "e3ao5F#n2H6("
vm-name            = "levelup-vm"
datastore          = "vsanDatastore"
host               = "esx04-r07.p01.5147f3d77ebf46a69ae345.canadacentral.avs.azure.com"
network            = "VMSegment"