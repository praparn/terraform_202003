############################################################
#              Define Variable to Operate                  #
############################################################
variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "region" {
  type = string
  description = "Defined region for operate"
}

variable "zone_id" {
  type = string
  description = "DNS Zone ID"
}

variable "availability_zone" {
  type = string
  description = "Avaliability zone for operate"
}

variable "aws_instance_labserver_ip" {
  type = map
  description = "Setup of machine ip and id"
}