locals {
  vm_ipaddress = substr(split(",", proxmox_vm_qemu.this.ipconfig0)[1], 3, -1)
  vm_ipgateway = substr(split(",", proxmox_vm_qemu.this.ipconfig0)[0], 3, -1)
}

output "vm_hostname" {
  description = "Hostname of the VM"
  value       = proxmox_vm_qemu.this.name
}

output "vm_ipaddress" {
  description = "IP Address of the VM."
  value       = local.vm_ipaddress
}

output "vm_ipgateway" {
  description = "IP Gateway of the VM"
  value       = local.vm_ipgateway
}

output "vm_macaddress" {
  description = "MAC Address of the VM."
  value       = proxmox_vm_qemu.this.network[0].macaddr
}

output "vm_information" {
  description = "Host Summary"
  value = {
    "hostname" : proxmox_vm_qemu.this.name,
    "ip" : local.vm_ipaddress,
    "mac" : proxmox_vm_qemu.this.network[0].macaddr,
    "tags" : proxmox_vm_qemu.this.tags
  }
}