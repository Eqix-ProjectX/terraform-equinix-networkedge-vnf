/*data "equinix_network_account" "pre" {
  metro_code = var.metro_code
  status     = "Active" 
}

data "equinix_network_account" "sec" {
  metro_code = var.sec_metro_code
  status     = "Active"
}
*/

resource "equinix_network_device" "c8kv-ha" {
  name              = "vd-${var.metro_code}-vnf-pre"
  metro_code        = var.metro_code
  type_code         = var.type_code
  self_managed      = true
  byol              = true
  package_code      = var.package_code
  notifications     = var.notifications
  hostname          = "vd-${var.metro_code}-vnf-pre"
  term_length       = 12
  account_number    = var.account_number
  version           = var.ver
  core_count        = var.core_count
  acl_template_id   = var.acl_template_id
  secondary_device {
    name            = "vd-${var.sec_metro_code}-vnf-sec"
    metro_code      = var.sec_metro_code
    hostname        = "vd-${var.sec_metro_code}-vnf-sec"
    notifications   = var.notifications
    account_number  = var.sec_account_number
    acl_template_id   = var.acl_template_id
  }
  ssh_key {
    username        = var.username
    key_name        = var.key_name
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = var.username
      password = equinix_network_device.c8kv-ha.vendor_configuration.adminPassword
      host     = equinix_network_device.c8kv-ha.ssh_ip_address
      timeout  = "5m"
    }
    inline     = [
      "conf t",
      "ip http secure-server",
      "restconf"
    ]    
  }
}

/*
resource "iosxe_interface_ethernet" "to_metal" {
  type                           = var.int_type
  name                           = var.int_name
  bandwidth                      = var.int_bw
  description                    = var.int_desc
  shutdown                       = false
  ip_proxy_arp                   = false
  ip_redirects                   = false
  ip_unreachables                = false
  ipv4_address                   = var.int_ipv4
  ipv4_address_mask              = var.int_mask
  # ip_dhcp_relay_source_interface = "Loopback100"
  # ip_access_group_in             = "1"
  # ip_access_group_in_enable      = true
  # ip_access_group_out            = "1"
  # ip_access_group_out_enable     = true
  # helper_addresses = [
  #   {
  #     address = "10.10.10.10"
  #     global  = false
  #     vrf     = "VRF1"
  #   }
  # ]
  # source_template = [
  #   {
  #     template_name = "TEMP1"
  #     merge         = false
  #   }
  # ]
  ipv6_enable             = false
  # ipv6_mtu                = 1300
  # ipv6_nd_ra_suppress_all = true
  # ipv6_address_dhcp       = true
  # ipv6_link_local_addresses = [
  #   {
  #     address    = "fe80::9656:d028:8652:66b6"
  #     link_local = true
  #   }
  # ]
  # ipv6_addresses = [
  #   {
  #     prefix = "2001:DB8::/32"
  #     eui_64 = true
  #   }
  # ]
  # arp_timeout             = 300
  # spanning_tree_link_type = "point-to-point"
  # service_policy_input    = "POLICY1"
  # service_policy_output   = "POLICY1"
}
*/