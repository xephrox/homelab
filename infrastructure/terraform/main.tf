terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.provider_pve_api_url
  pm_api_token_id     = var.provider_pve_token_id
  pm_api_token_secret = var.provider_pve_token_secret
  pm_tls_insecure     = false
}