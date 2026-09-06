provider "proxmox" {
  endpoint = "https://{{ secrets.PVE_IP }}:8006/"
  username = "root@pam"
  password = "{{ secrets.PVE_PASSWORD }}"
  insecure = true
}

resource "proxmox_user_token" "user_token" {
  comment         = "Managed by Terraform"
  expiration_date = "2033-01-01T22:00:00Z"
  token_name      = "tk1"
  user_id         = "root@pam"
}
