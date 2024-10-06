resource "proxmox_lxc" "this" {
  hostname     = var.lxc_hostname
  description  = var.lxc_description
  target_node  = var.proxmox_host
  vmid         = var.lxc_id
  ostemplate   = "${var.lxc_template_storage_location}:vztmpl/${var.lxc_template_name}"
  cores        = var.lxc_cpu_cores
  memory       = var.lxc_memory
  swap         = var.lxc_swap
  unprivileged = var.lxc_unprivileged
  onboot       = var.lxc_onboot
  start        = true

  rootfs {
    storage = var.lxc_storage_location
    size    = "${var.lxc_disk_size}G"
  }

  dynamic "mountpoint" {
    for_each = var.lxc_mountpoints != null ? var.lxc_mountpoints : {}
    content {
      key     = mountpoint.key
      slot    = mountpoint.value.slot
      storage = mountpoint.value.storage
      mp      = mountpoint.value.mp
      size    = mountpoint.value.size
    }
  }

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    firewall = true
    ip       = var.lxc_ipaddress
    tag      = var.lxc_vlan
  }

  password        = var.lxc_password
  ssh_public_keys = var.lxc_ssh_public_keys

  tags = var.lxc_tags
}