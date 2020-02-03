variable "region" {}
provider "aws" {
    profile = "default"
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