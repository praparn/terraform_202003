### Create the EC2(s) Lab ###
resource "aws_instance" "ec2" {
  for_each          = var.tag_ec2_name
  ami               = lookup(var.ami, var.server_type)
  instance_type     = lookup(var.instance_type, var.server_type)
  availability_zone = var.az2
  monitoring        = var.ec2_monitor
  key_name          = var.keypair
  subnet_id                   = var.subnet_public_1b
  vpc_security_group_ids      = [var.secgroup_lab]
  user_data                   = <<-EOF
                              #!/bin/bash
                              curl https://raw.githubusercontent.com/praparn/sourcesetup/master/standard_terraform_aws.sh > /tmp/setup.sh
                              chmod +x /tmp/setup.sh
                              /tmp/setup.sh
                              EOF
  iam_instance_profile        = var.iaminstanceprofile_ec2
  associate_public_ip_address = var.associate_public_ip_address
  root_block_device {
    volume_type           = var.volume_type_std
    volume_size           = var.volume_size_boot_std
    delete_on_termination = var.delete_on_termination
  }

  tags = {
    Environment = var.tag_environment
    Region      = var.tag_region
    AZ          = var.tag_az2
    Categories  = var.tag_category
    Name        = each.value
    Zone        = var.tag_zonenone
    Module      = var.tag_modulename
  }
  
}

output "ec2_output_id" {
  value = [
    for instance in aws_instance.ec2:
    instance.id
  ]
}
output "ec2_output_keyname" {
  value = [
    for instance in aws_instance.ec2:
    instance.key_name
  ]
}
output "ec2_output_public_ip" {
  value = [
    for instance in aws_instance.ec2:
    instance.public_ip
  ]
}
output "ec2_output_public_dns" {
  value = [
    for instance in aws_instance.ec2:
    instance.public_dns
  ]
}