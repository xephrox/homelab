locals {
  ip_first_three_octets = join(".", slice(split(".", var.vm_ipaddress), 0, 3))
  #ip_forth_octet        = split(".", var.vm_ipaddress)[3]
}

resource "proxmox_vm_qemu" "this" {
  name        = var.vm_hostname
  target_node = var.proxmox_host
  vmid        = var.vm_vmid
  clone       = var.vm_template_name
  full_clone  = true
  agent       = 1
  os_type     = "cloud-init"
  cores       = var.vm_cpu_cores
  sockets     = var.vm_cpu_sockets
  cpu         = "host"
  memory      = var.vm_memory
  onboot      = true
  scsihw      = "virtio-scsi-single"
  bootdisk    = "scsi0"
  disks {
    ide {
      ide0 {
        disk {
          size    = "${var.vm_disk_size}G"
          storage = var.vm_storage_location
        }
      }
      ide1 {
        cloudinit {
          storage = var.vm_storage_location
        }
      }
    }
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = var.vm_vlan
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  # https://cloudinit.readthedocs.io/en/latest/reference/network-config-format-v2.html
  ipconfig0 = "gw=${local.ip_first_three_octets}.1,ip=${var.vm_ipaddress}/24"

  ciuser     = var.ci_user
  cipassword = var.ci_password
  sshkeys    = var.ci_ssh_authorized_keys

  tags = var.vm_tags

}