############################################################
#              Define Variable to Operate                  #
############################################################
variable "projectname" {
  type = string
  description = "Project Name"
}

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
  type = map
  description = "Defined compute instance type"
}

variable "user_data" {
  type = map
  description = "User data script"
}

variable "availability_zone" {
  type = string
  description = "Avaliability zone for operate"
}

variable "keypair" {
  type = string
  description = "Keypair for authentication"
}


variable "tag_environment" {
  type = string
  description = "Define Environment for Operate"
}

variable "tag_region" {
  type = string
  description = "Define region for operate"
}

variable "tag_az" {
  type = string
  description = "Define avalibility zone for operate"
}

variable "tag_category" {
  type = string
  description = "Define category of object to create"
}

variable "tag_name" {
  type = map
  description = "Define name of compute"
}

variable "tag_zone" {
  type = string
  description = "Define public or private zone"
}

variable "tag_module" {
  type = string
  description = "Define module to create"
}

variable "tag_billing" {
  type = string
  description = "Define billing project to operate"
}