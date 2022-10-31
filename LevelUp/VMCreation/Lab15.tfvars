# Network configuration
nsx_ip       = "https://10.15.0.2/"
nsx_username = "cloudadmin"
nsx_password = "d$14cV15xF*p"
nsx_tag      = "Test"
dhcp_profile = {
    # DHCP Server IP
    server_address = "192.168.0.1/30"
    # Lease
    lease_time     = 86400
    # DNS Server nsx_ip
    dns_servers    = ["8.8.8.8"]
    display_name = "test"
    description = "test"
}
overlay_tz = {
    # Overlay TZ Name
    display_name = # <"TNTXX-OVERLAY-TZ">
}
t0_gateway = {
    # T0 GW name
    display_name = "TNT91-T0"
}
t1_gateway = {
    # T1 GW name
    display_name = "TNT91-T1"
}
edge_cluster = {
    # Edge Cluster
    display_name = "TNT91-CLSTR"
}
lup_oct22_segment = {
  description  = # <Segment desc>
  display_name = # <Seg Name>
  subnet = {
    # CIDR for your segment
    cidr                = "192.168.11.1/24"
    # DHCP IP Range for VMs
    dhcp_ranges         = ["192.168.11.4-192.168.11.20"]
    # DHCP Details
    dhcp_v4_config      = {
      server_address = "192.168.0.1/30"
      lease_time     = 86400
      dns_servers    = ["8.8.8.8"]
    }
  }
  tag = {
    scope = # <Scope >
    tag   = # <tag>
  }
}

# VM configuration
vsphere_datacenter = "LEVELUP-LAB15-SDDC"
vsphere_server     = "https://10.15.0.2/"
vsphere_user       = "cloudadmin@vsphere.local"
vsphere_password   = "7j#57K)rQah8"
vm-name            = "levelup-vm"
datastore          = "vSANDatastore"
host               = # <ESXi Host Name>
network            = "lup_oct22_segment"
