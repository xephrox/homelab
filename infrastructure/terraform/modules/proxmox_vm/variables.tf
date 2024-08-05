variable "ci_password" {
  description = "Password of the CI User that will be automatically created by cloudinit"
  type        = string
  sensitive   = true
}
variable "ci_ssh_authorized_keys" {
  description = "SSH Public Key of CI User to allow SSH authentication."
  type        = string
}
variable "ci_user" {
  description = "Username of CI User that will be automatically created by cloudinit."
  type        = string
}
variable "proxmox_host" {
  description = "The name of the Proxmox server listed under Datacenter."
  type        = string
}
variable "vm_cpu_cores" {
  description = "The number of CPU cores to assign the VM in Proxmox."
  type        = number
}
variable "vm_cpu_sockets" {
  description = "The number of CPU sockets to assign the VM in Proxmox."
  type        = number
}
variable "vm_disk_size" {
  description = "The size of the primary disk of the VM in Proxmox."
  type        = number
}
variable "vm_hostname" {
  description = "The name of the VM to be used within Proxmox"
  type        = string
}
variable "vm_ipaddress" {
  description = "The IP Address to assign to the VM without CIDR notification. Example: '192.168.100.102'."
  type        = string
}
variable "vm_memory" {
  description = "The amount of RAM memory to assign the VM in Proxmox."
  type        = number
}
variable "vm_storage_location" {
  description = "The storage location to store the VM Disk listed under Node>Storage."
  type        = string
}
variable "vm_tags" {
  description = "Tags to apply to the VM in Proxmox. TODO: Assign Ansible Groups here."
  type        = string
}
variable "vm_template_name" {
  description = "The name of the VM Template to clone in Proxmox."
  type        = string
}
variable "vm_vlan" {
  description = "The VLAN ID of the network to deploy the server."
  type        = number
}
variable "vm_vmid" {
  description = "The VMID of the VM in Proxmox."
  type        = number
}