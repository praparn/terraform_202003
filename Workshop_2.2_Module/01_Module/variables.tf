############################################################
#              Define Variable to Operate                  #
############################################################
variable "module_source" {
  type = string
  description = "Source Module"
}

variable "nb_public_ip" {
  type = number
  description = "Number of Public IP"
}

variable "public_ip_dns" {
  type = string
  description = "Name of DNS on Compute"
}

variable "modulenetwork_allowssh" {
  type = string
  description = "Module Network Allow SSH Flag"
}

variable "ossimple" {
  type = string
  description = "OS Simple"
}

variable "remote_port" {
  type = string
  description = "Remote Port"
}

variable "admin_username" {
  type = string
  description = "Administrator username"
}

variable "location_name" {
  type = string
  description = "Location of Azure"
}

variable "rscgrp_name" {
  type = string
  description = "Resource Name"
}

variable "vm_hostname" {
  type = string
  description = "Hostname of VM"
}

variable "tag_rscgrp" {
  type = string
  description = "Tag for Resouce Name"
}

variable "tag_environment" {
  type = string
  description = "Define Environment for Operate"
}

variable "tag_location" {
  type = string
  description = "Define location for operate"
}

variable "tag_category" {
  type = string
  description = "Define category of object to create"
}

variable "tag_zone" {
  type = string
  description = "Define public or private zone"
}

variable "tag_billing" {
  type = string
  description = "Define billing project to operate"
}

variable "tag_module" {
  type = string
  description = "Define Module"
}

variable "ssh_key" {
  type = string
  description = "Location of SSH Key"
}

variable "vm_size" {
  type = string
  description = "Type of VM Sizing"
}