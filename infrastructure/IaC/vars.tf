variable "ssh_key" {
    # TODO I know, I know... it's the worst practice ever but I'll encrypt it later. FOR SURE!
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINVZtOSIXr08cuq1D8CgfpbmXrZZ4PPwAiA+P86fMiBZ etham@bastion"
}
variable "proxmox_host" {
    default = "macon"
}
variable "template_name" {
    default = "ubuntu-2204-cloudinit-template"
}

variable "pm_api_url" {
    default = "https://rhone.sytes.net/api2/json"
}

variable "token_id" {
    default = "alohomora@pam!idp_token"
}

# TODO I know, I know... it's the worst practice ever but I'll encrypt it later. FOR SURE!
variable "token_secret" {
    default = "af52501e-d38d-410a-96cb-21022306fb34"
}

variable "storageloc" {
    default = "local-lvm"
}

variable "controler_num" {
    default = "1"
}

variable "nodes_num" {
    default = "2"
}

