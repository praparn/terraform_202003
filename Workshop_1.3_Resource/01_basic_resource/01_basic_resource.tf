variable "region" {}
provider "aws" {
    region = var.region
}

resource "aws_instance" "lab" {
  ami           = "ami-81cefcfd" #ubuntu-xenial-16.04-amd64-server
  instance_type = "t3a.nano"
  key_name = "keypair"
}

output "aws_instance_lab_id" {
  value = aws_instance.lab.id
}

output "aws_instance_lab_public_ip" {
  value = aws_instance.lab.public_ip
}

output "aws_instance_lab_public_dns" {
  value = aws_instance.lab.public_dns
}

output "aws_instance_lab_keyname" {
  value = aws_instance.lab.key_name
}