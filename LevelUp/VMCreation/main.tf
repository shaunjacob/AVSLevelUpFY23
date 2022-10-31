module "vm" {
  source             = "./vm"
  vsphere_datacenter = var.vsphere_datacenter
  vsphere_server     = var.vsphere_server
  vsphere_user       = var.vsphere_user
  vsphere_password   = var.vsphere_password
  network            = module.network.segment
  host               = var.host
  depends_on = [
    time_sleep.wait_90_seconds
  ]
}
