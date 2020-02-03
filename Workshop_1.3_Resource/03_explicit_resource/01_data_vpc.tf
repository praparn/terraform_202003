data "aws_vpc" "labvpc" {
  id = "vpc-4483e921"
}

output "aws_vpc_cidr" {
  value = data.aws_vpc.labvpc.cidr_block
}