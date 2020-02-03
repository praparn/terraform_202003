resource "aws_instance" "labserver1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3a.nano"
  key_name = "keypair"
  availability_zone = "ap-southeast-1a"
  root_block_device {
    volume_type           = "gp2"
    volume_size           = "10"
    delete_on_termination = "true"
  }
  vpc_security_group_ids = [aws_security_group.secgroup_server1.id]
  user_data                   = <<-EOF
                              #!/bin/bash
                              curl https://raw.githubusercontent.com/praparn/sourcesetup/master/standard_nginx.sh > /tmp/setup.sh
                              chmod +x /tmp/setup.sh
                              /tmp/setup.sh
                              EOF
  
  tags = {
    Environment = "rd"
    Region      = "ap-southeast-1"
    AZ          = "ap-southeast-1a"
    Categories  = "compute"
    Name        = "labresource-server1-student-X"
    Zone        = "public"
    Module      = "ec2"
    Billing     = "terraform-workshop"
  }
}

resource "aws_instance" "labserver2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3a.nano"
  key_name = "keypair"
  availability_zone = "ap-southeast-1a"
  root_block_device {
    volume_type           = "gp2"
    volume_size           = "10"
    delete_on_termination = "true"
  }
  vpc_security_group_ids = [aws_security_group.secgroup_server2.id]
  user_data                   = <<-EOF
                              #!/bin/bash
                              curl https://raw.githubusercontent.com/praparn/sourcesetup/master/standard_docker_aws.sh > /tmp/setup.sh
                              chmod +x /tmp/setup.sh
                              /tmp/setup.sh
                              EOF
  
  tags = {
    Environment = "rd"
    Region      = "ap-southeast-1"
    AZ          = "ap-southeast-1a"
    Categories  = "compute"
    Name        = "labresource-server2-student-X"
    Zone        = "public"
    Module      = "ec2"
    Billing     = "terraform-workshop"
  }
}
output "aws_instance_labserver1_id" {
  value = aws_instance.labserver1.id
}

output "aws_instance_labserver2_id" {
  value = aws_instance.labserver2.id
}

output "aws_instance_labserver1_ip" {
  value = aws_instance.labserver1.public_ip
}

output "aws_instance_labserver2_ip" {
  value = aws_instance.labserver2.public_ip
}

output "aws_instance_labserver1_public_dns" {
  value = aws_instance.labserver1.public_dns
}

output "aws_instance_labserver2_public_dns" {
  value = aws_instance.labserver2.public_dns
}

output "aws_instance_lab_keyname" {
  value = aws_instance.labserver1.key_name
}