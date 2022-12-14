# VM Variables
variable "vsphere_datacenter" {
  type = string
}

variable "vsphere_server" {
  type = string
}
variable "vsphere_user" {
  type = string
}
variable "vsphere_password" {
  type = string
}

variable "vm-name" {
  type = string
}

variable "datastore" {
  type = string  
  default = "vsanDatastore"
}

variable "cluster" {
  type = string  
  default = "Cluster-1"
}

variable "host" {
  type = string  
  default = "testvm"
}
variable "network" {
  type = string  
}

