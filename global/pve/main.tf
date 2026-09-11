terraform {
  required_providers {
    proxmox = {    
      source = "bpg/proxmox"
      version = "~> 0.112.0"
    }
  }

  backend "s3" {
    key            = "global/pve/terraform.tfstate"
    bucket         = "pve-iac-project-tfstate-9ut8e"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "proxmox" {
  insecure = true
}

resource "proxmox_api_token" "api_token" {
  comment         = "Managed by Terraform"
  expiration_date = "2033-01-01T22:00:00Z"
  token_name      = "gh_tf"
  user_id         = "root@pam"
}