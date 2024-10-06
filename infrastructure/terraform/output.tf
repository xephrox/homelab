output "vm_information" {
  value = values(module.pve_vms)[*].vm_information
}

output "lxc_information" {
  value = values(module.pve_lxc)[*].lxc_information
}