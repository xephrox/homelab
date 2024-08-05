module "pve_vms" {
  source = "./modules/proxmox_vm"

  for_each = var.instances

  proxmox_host = each.value.proxmox_host

  vm_hostname         = each.key
  vm_vmid             = each.value.vm_vmid
  vm_template_name    = each.value.vm_template_name
  vm_cpu_cores        = each.value.vm_cpu_cores
  vm_cpu_sockets      = each.value.vm_cpu_sockets
  vm_memory           = each.value.vm_memory
  vm_disk_size        = each.value.vm_disk_size
  vm_storage_location = each.value.vm_storage_location
  vm_ipaddress        = each.value.vm_ipaddress
  vm_vlan             = each.value.vm_vlan
  vm_tags             = each.value.vm_tags

  ci_user                = each.value.ci_user
  ci_password            = each.value.ci_password
  ci_ssh_authorized_keys = each.value.ci_ssh_authorized_keys

}
