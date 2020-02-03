variable "region" {}
variable "access_key" {}
variable "secret_key" {}
provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    version = "~> 2.0"
    region = var.region
}

data "aws_vpc" "vpc" {
  id = "vpc-4483e921"
}

output "aws_vpc_arn" {
  value = data.aws_vpc.vpc.arn
}

output "aws_vpc_cidr" {
  value = data.aws_vpc.vpc.cidr_block
}