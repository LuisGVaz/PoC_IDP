variable "ssh_key" {
    # TODO I know, I know... it's the worst practice ever but I'll encrypt it later. FOR SURE!
  default = "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBACXq4ooGPBd0uqU5uwsWKMP6NiLk9Y1kDIDVMNjURWGVK6ZHSSJRfzv3F9prl3f4uw0oZeRIjb1xeTVNbS6DNWBmAHyuXJPabpW4u9+H/I7gO3RMzjI00wLjzBZz8o0Wwrt0jJnQB8LezrNltQgdn0TpMrUEEuvq5SJfMfwEeDbi2BAOw== etham@macon"
}
variable "proxmox_host" {
    default = "macon"
}
variable "template_name" {
    default = "ubuntu-2204-cloudinit-template"
}

variable "pm_api_url" {
    default = "https://rhone.sytes.net/api2/json" # This URI is comming from no-ip pointing to PROMOX Server in my personal Public IP at home
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