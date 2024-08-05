output "vm_information" {
  value = values(module.pve_vms)[*].vm_information
}