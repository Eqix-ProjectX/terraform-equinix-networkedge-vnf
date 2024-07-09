output "hostname_vd" {
  value = equinix_network_device.c8kv-ha.hostname
}
output "hostname_vd_sec" {
  value = equinix_network_device.c8kv-ha.secondary_device[0].hostname
}
output "ssh_ip_vd" {
  value = equinix_network_device.c8kv-ha.ssh_ip_address
}
output "ssh_ip_vd_sec" {
  value = equinix_network_device.c8kv-ha.secondary_device[0].ssh_ip_address
}
# output "pass" {
#   value = equinix_network_device.c8kv-ha.vendor_configuration.adminPassword
# }
# output "pass_sec" {
#   value = equinix_network_device.c8kv-ha.secondary_device[0].vendor_configuration.adminPassword
# }