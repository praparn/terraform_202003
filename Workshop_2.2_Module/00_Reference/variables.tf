############################################################
#              Define Variable to Operate                  #
############################################################
variable "rscgrp_name" {
  type = string
  description = "Resource Group Name"
}

variable "vrtnwk_name" {
  type = string
  description = "Virtual Network Name"
}

variable "publicip_name" {
  type = string
  description = "Public IP Addres Name"
}

variable "publicip_allocation" {
  type = string
  description = "Public IP Allocation Method"
}

variable "privateip_allocation" {
  type = string
  description = "Private IP Allocation Method"
}

variable "vrtnwk_space" {
  type = string
  description = "Virtual Network Range"
}

variable "vrtsnt_space" {
  type = string
  description = "Virtual Subnet Range"
}

variable "vrtsnt_name" {
  type = string
  description = "Virtual Subnet Range"
}
variable "location_name" {
  type = string
  description = "Location of Azure"
}

variable "accreptype" {
  type = string
  description = "Account Replication Type"
}

variable "acctier" {
  type = string
  description = "Account Tier"
}

variable "nicintname" {
  type = string
  description = "Nic Card Interface Name"
}

variable "vmname" {
  type = string
  description = "VMWare Name"
}

variable "vmsize" {
  type = string
  description = "Sizing of VM"
}

variable "keydata" {
  type = string
  description = "ssh key for access"
}

variable "tag_rscgrp" {
  type = string
  description = "Tag for Resouce Name"
}

variable "tag_vrtnwk" {
  type = string
  description = "Tag for Virtual Name"
}

variable "tag_plcip" {
  type = string
  description = "Tag for Public IP"
}

variable "tag_secgrp" {
  type = string
  description = "Tag for Security Group"
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

variable "tag_name" {
  type = map
  description = "Define name of ec2"
}

variable "tag_zone" {
  type = string
  description = "Define public or private zone"
}

variable "tag_module" {
  type = string
  description = "Define module to create"
}

variable "tag_modulevm" {
  type = string
  description = "Define tag for vm name"
}

variable "tag_billing" {
  type = string
  description = "Define billing project to operate"
}

variable "tag_stoacc" {
  type = string
  description = "Define storage account"
}