variable "provider_pve_api_url" {
  description = "The Proxmox Web UI address, with /api2/json added to it."
  type        = string
}
variable "provider_pve_token_id" {
  description = "The API Token ID used to authenticate with the Proxmox API."
  type        = string
  default     = "terraform@pam!terraform_token_id"
}
variable "provider_pve_token_secret" {
  description = "The API Token Secret used to authenticate with the Proxmox API."
  type        = string
}
variable "instances" {
  description = "Map of VM instance configurations."
  type = map(object({
    ci_password            = string
    ci_ssh_authorized_keys = string
    ci_user                = string
    proxmox_host           = string
    vm_cpu_cores           = number
    vm_cpu_sockets         = number
    vm_disk_size           = number
    vm_ipaddress           = string
    vm_memory              = number
    vm_storage_location    = string
    vm_tags                = string
    vm_template_name       = string
    vm_vlan                = number
    vm_vmid                = optional(number, 0)
  }))
  default = {}
}

variable "containers" {
  description = "Map of LXC container configurations."
  type = map(object({
    proxmox_host              = string
    description               = string
    id                        = optional(number, 0)
    template_name             = string
    template_storage_location = string
    cpu_cores                 = number
    memory                    = number
    swap                      = number
    unprivileged              = optional(bool, true)
    onboot                    = optional(bool, true)
    storage_location          = string
    disk_size                 = string
    ipaddress                 = string
    vlan                      = number
    password                  = optional(string, "")
    ssh_public_keys           = string
    tags                      = string
    mountpoints = optional(map(object({
      slot    = number
      storage = string
      mp      = string
      size    = string
    })), {})
  }))
  default = {}
}