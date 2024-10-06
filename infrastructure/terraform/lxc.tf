module "pve_lxc" {
  source = "./modules/proxmox_lxc"

  for_each = var.containers

  proxmox_host = each.value.proxmox_host

  lxc_hostname                  = each.key
  lxc_description               = each.value.description
  lxc_id                        = each.value.id
  lxc_template_name             = each.value.template_name
  lxc_template_storage_location = each.value.template_storage_location
  lxc_cpu_cores                 = each.value.cpu_cores
  lxc_memory                    = each.value.memory
  lxc_swap                      = each.value.swap
  lxc_unprivileged              = each.value.unprivileged
  lxc_onboot                    = each.value.onboot
  lxc_storage_location          = each.value.storage_location
  lxc_disk_size                 = each.value.disk_size
  lxc_ipaddress                 = each.value.ipaddress
  lxc_vlan                      = each.value.vlan
  lxc_password                  = each.value.password
  lxc_ssh_public_keys           = each.value.ssh_public_keys
  lxc_tags                      = each.value.tags
  lxc_mountpoints               = each.value.mountpoints
}