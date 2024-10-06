variable "lxc_hostname" {
  description = "The name of the LXC container to be used within Proxmox"
  type        = string
}

variable "lxc_description" {
  description = "The description of the LXC container to be used within Proxmox"
  type        = string
}

variable "proxmox_host" {
  description = "The name of the Proxmox server listed under Datacenter."
  type        = string
}

variable "lxc_id" {
  description = "The ID of the LXC container to be used within Proxmox"
  type        = number
}

variable "lxc_template_name" {
  description = "The name of the LXC template to clone in Proxmox"
  type        = string
}

variable "lxc_template_storage_location" {
  description = "The storage location of the LXC template in Proxmox"
  type        = string
}

variable "lxc_cpu_cores" {
  description = "The number of CPU cores to assign the VM in Proxmox."
  type        = number
}

variable "lxc_memory" {
  description = "The amount of RAM memory to assign the VM in Proxmox."
  type        = number
}

variable "lxc_swap" {
  description = "The amount of swap memory to assign the VM in Proxmox."
  type        = number
}

variable "lxc_storage_location" {
  description = "The storage location to store the LXC container in Proxmox."
  type        = string
}

variable "lxc_disk_size" {
  description = "The size of the primary disk of the LXC container in Proxmox (in GB)."
  type        = number
}

variable "lxc_ipaddress" {
  description = "The IP Address to assign to the LXC container without CIDR notification. Example: '192.168.100.102'."
  type        = string
}

variable "lxc_vlan" {
  description = "The VLAN ID of the network to deploy the server."
  type        = number
}

variable "lxc_password" {
  description = "The password of the LXC container user."
  type        = string
  sensitive   = true
  default     = ""
}

variable "lxc_ssh_public_keys" {
  description = "The SSH public keys of the LXC container user."
  type        = string
}

variable "lxc_tags" {
  description = "The tags of the LXC container to be used within Proxmox"
  type        = string
}

variable "lxc_unprivileged" {
  description = "The unprivileged feature of the LXC container to be used within Proxmox"
  type        = bool
  default     = true
}

variable "lxc_onboot" {
  description = "The onboot feature of the LXC container to be used within Proxmox"
  type        = bool
  default     = true
}

variable "lxc_mountpoints" {
  description = "Map of mountpoints to create for the LXC container"
  type = map(object({
    slot    = number
    storage = string
    mp      = string
    size    = string
  }))
  default = null
}