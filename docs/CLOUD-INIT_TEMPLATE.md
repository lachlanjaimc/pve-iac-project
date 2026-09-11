I will use the official Ubuntu 26.04 cloud-init image to create an image template
https://cloud-images.ubuntu.com/releases/resolute/release/

Proxmox has some documentation on creating templates. I will translate this into a  **proxmox_virtual_environment_vm** resource

https://pve.proxmox.com/wiki/Cloud-Init_Support
https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_vm

This reusable template will be used to create other Terraform resources and configured with Ansible