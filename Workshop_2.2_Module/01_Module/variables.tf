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

variable "tag_category_linux" {
  type = string
  description = "Define category of virtual machine"
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

variable "enable_accelerated_networking" {
  type = bool
  description = "Flag for enable_accelerated_networking"
}

variable "nb_instances" {
  type = number
  description = "Number of Instance to Create"
}

variable "boot_diagnostics" {
  type = bool
  description = "Flag for diag boot"
}

variable "delete_os_disk_on_termination" {
  type = bool
  description = "Flag for delete disk when terminate"
}

variable "data_disk" {
  type = bool
  description = "Flag for add data disk on instance"
}

variable "data_disk_size_gb" {
  type = number
  description = "Sizing of data disk"
}

variable "data_sa_type" {
  type = string
  description = "Type of sa on disk"
}

variable "vm_os_sku" {
  type = string
  description = "Type of SKU on os"
}

varaible "custom_data" {
  type = string
  description = "Script for setup vmware application"
}

variable "vm_os_offer" {
  type = string
  description = "OS offer"
}

variable "vm_os_publisher" {
  type = string
  description = "OS publisher"
}