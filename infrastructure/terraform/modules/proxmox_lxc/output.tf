output "lxc_hostname" {
  description = "Hostname of the LXC container"
  value       = proxmox_lxc.this.hostname
}

output "lxc_ipaddress" {
  description = "IP Address of the LXC container"
  value       = proxmox_lxc.this.network[0].ip
}

output "lxc_macaddress" {
  description = "MAC Address of the LXC container"
  value       = proxmox_lxc.this.network[0].hwaddr
}

output "lxc_information" {
  description = "Host Summary"
  value = {
    "hostname" : proxmox_lxc.this.hostname,
    "ip" : proxmox_lxc.this.network[0].ip,
    "mac" : proxmox_lxc.this.network[0].hwaddr,
    "tags" : proxmox_lxc.this.tags
  }
}
