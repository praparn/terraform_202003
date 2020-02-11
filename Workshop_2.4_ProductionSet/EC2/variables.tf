##############################
#         static value      #
##############################
//Global Parameter
variable "access_key" {}
variable "secret_key" {}
variable "vpc_id" {}
variable "vpc_cidr" {}
variable "rtb_public" {}
variable "subnet_public_1a" {}
variable "subnet_public_1b" {}
variable "subnet_public_1c" {}
variable "secgroup_lab" {}
variable "keypair" {}
variable "iamrole_ec2" {}
variable "iampolicy_ec2" {}
variable "iaminstanceprofile_ec2" {}
variable "ami" {
  type = map
  default = {
    "jump"       = "ami-81cefcfd"
    "jenkin"     = "ami-81cefcfd"
    "kubernetes" = "ami-81cefcfd"
    "cms"        = "ami-81cefcfd"
    "other"      = "ami-81cefcfd"
    "lab"      = "ami-81cefcfd"
  }
}
variable "instance_type" {
  type = map

  default = {
    "jump"       = "t3.micro"
    "jenkin"     = "t3.micro"
    "kubernetes" = "t3.micro"
    "cms"        = "t3.micro"
    "other"      = "t3.micro"
    "lab"      = "t3.micro"
  }
}
variable "tag_ec2_name" {
  type = map

  default = {
    "0"     = "ec2-lab-35"
    "1"     = "ec2-lab-01"
    "2"     = "ec2-lab-02"
    "3"     = "ec2-lab-03"
    "4"     = "ec2-lab-04"
    "5"     = "ec2-lab-05"
    "6"     = "ec2-lab-06"
    "7"     = "ec2-lab-07"
    "8"     = "ec2-lab-08"
    "9"     = "ec2-lab-09"
    "10"     = "ec2-lab-10"
    "11"     = "ec2-lab-11"
    "12"     = "ec2-lab-12"
    "13"     = "ec2-lab-13"
    "14"     = "ec2-lab-14"
    "15"     = "ec2-lab-15"
    "16"     = "ec2-lab-16"
    "17"     = "ec2-lab-17"
    "18"     = "ec2-lab-18"
    "19"     = "ec2-lab-19"
    "20"     = "ec2-lab-20"
    "21"     = "ec2-lab-21"
    "22"     = "ec2-lab-22"
    "23"     = "ec2-lab-23"
    "24"     = "ec2-lab-24"
    "25"     = "ec2-lab-25"
    "26"     = "ec2-lab-26"
    "27"     = "ec2-lab-27"
    "28"     = "ec2-lab-28"
    "29"     = "ec2-lab-29"
    "30"     = "ec2-lab-30"
    "31"     = "ec2-lab-31"
    "32"     = "ec2-lab-32"
    "33"     = "ec2-lab-33"
    "34"     = "ec2-lab-34"
  }
}

variable "region" {}
variable "az1" {}
variable "az2" {}
variable "az3" {}
variable "ec2_monitor" {}
variable "associate_public_ip_address" {}
variable "volume_type_std" {}
variable "volume_size_boot_std" {}
variable "delete_on_termination" {}
variable "server_type" {}

//TAG variable section//
variable "tag_environment" {}
variable "tag_region" {}
variable "tag_aznone" {}
variable "tag_az1" {}
variable "tag_az2" {}
variable "tag_az3" {}
variable "tag_category" {}
variable "tag_modulenone" {}
variable "tag_modulename" {}
variable "tag_modulesecgroup" {}
variable "tag_zonenone" {}
variable "tag_zonepublic" {}
variable "tag_zoneprivate" {}
