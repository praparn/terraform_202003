############################################################
#              Define Variable to Operate                  #
############################################################
variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "zone_id" {
  type = string
  description = "DNS Zone ID"
}

variable "region" {
  type = string
  description = "Defined region for operate"
}

variable "instancecount" {
  type = number
  description = "Total instance to create"
}

variable "server_type" {
  type = string
  description = "Defined server type for operate"
  default= "other"
}

variable "instance_type" {
  type = map
  description = "Defined EC2 instance type"
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

variable "rootblockdevice_volume_type" {
  type = string
  description = "Define volume type of root stroage"
}

variable "rootblockdevice_volume_size" {
  type = number
  description = "Define volume size of root storage"
}

variable "rootblockdevice_delete_on_termination" {
  type = bool
  description = "Flag for delete storage when ec2 delete"
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

variable "tag_billing" {
  type = string
  description = "Define billing project to operate"
}