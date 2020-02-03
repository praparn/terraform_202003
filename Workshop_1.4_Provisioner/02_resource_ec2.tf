resource "aws_instance" "lab" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3a.nano"
  key_name = "keypair"
  availability_zone = "ap-southeast-1c"
  provisioner "remote-exec" {
    when    = destroy
    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "~/terraformlab"
    host     = self.public_ip
  }
    inline = [
      "sudo umount -a"
    ]
    on_failure = continue
  }
  root_block_device {
    volume_type           = "gp2"
    volume_size           = "10"
    delete_on_termination = "true"
  }
  
  tags = {
    Environment = "rd"
    Region      = "ap-southeast-1"
    AZ          = "ap-southeast-1c"
    Categories  = "compute"
    Name        = "labresource-student-X"
    Zone        = "public"
    Module      = "ec2"
    Billing     = "terraform-workshop"
  }
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