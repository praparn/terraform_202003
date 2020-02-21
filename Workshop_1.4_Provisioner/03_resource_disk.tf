resource "aws_ebs_volume" "labebs" {
  availability_zone = "ap-southeast-1c"
  size              = "10"
  type              = "gp2"

  tags = {
    Environment = "rd"
    Region      = "ap-southeast-1"
    AZ          = "ap-southeast-1c"
    Categories  = "storage"
    Name        = "EBSlabresource-student-X"
    Zone        = "public"
    Module      = "ebs"
    Billing     = "terraform-workshop"
  }
}

resource "aws_volume_attachment" "labebsattach" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.labebs.id
  instance_id = aws_instance.lab.id
  provisioner "remote-exec" {
    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("/home/ubuntu/terraformlab")
    host     = aws_instance.lab.public_ip
  }
    inline = [
      "sudo mkfs -t xfs /dev/nvme1n1",
      "sudo mkdir /additionalstorage",
      "sudo mount /dev/nvme1n1 /additionalstorage"
    ]
    on_failure = fail
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'umount done for destroy (event)'"
  }
}

output "aws_ebs_volume_labebs_id" {
  value = aws_ebs_volume.labebs.id
}