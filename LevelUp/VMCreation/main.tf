module "vm" {
  source             = "./vm"
  vsphere_datacenter = var.vsphere_datacenter
  vsphere_server     = var.vsphere_server
  vsphere_user       = var.vsphere_user
  vsphere_password   = var.vsphere_password
  network            = var.network
  host               = var.host
}
