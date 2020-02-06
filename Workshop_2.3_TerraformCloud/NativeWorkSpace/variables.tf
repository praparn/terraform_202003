############################################################
#              Define Variable to Operate                  #
############################################################
variable "zone" {
  type = string
  description = "Zone Name"
}

variable "region" {
  type = string
  description = "Region Name"
}

variable "image" {
  type = string
  description = "Image for OS"
}

variable "scratch_disk" {
  type = string
  description = "Type of Disk Interface"
}

variable "disk_size" {
  type = number
  description = "Sizing of Disk"
}

variable "gcompute_network_name" {
  type = string
  description = "VPC Name"
}

variable "gcompute_createsubnet" {
  type = bool
  description = "Flag for auto create subnet mask"
}

variable "compute_name" {
  type = string
  description = "Create compute name"
}

variable "compute_type" {
  type = string
  description = "Defined compute instance type"
}

variable "user_data" {
  type = map
  description = "User data script"
}