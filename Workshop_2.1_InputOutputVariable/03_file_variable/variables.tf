############################################################
#              Define Variable to Operate                  #
############################################################
variable "region" {
  type = string
  description = "Defined region for operate"
}

variable "ami" {
  type = string
  description = "Defined AMI ID"
}

variable "instancetype" {
  type = string
  description = "Defined EC2 Instance Type"
}

variable "keypair" {
  type = string
  description = "Keypair for Authentication"
}
