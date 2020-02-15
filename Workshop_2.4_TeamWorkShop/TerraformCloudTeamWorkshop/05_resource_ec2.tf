resource "aws_instance" "labserver" {
  count                   = var.instancecount
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = lookup(var.instance_type, var.server_type)
  key_name                = var.keypair
  availability_zone       = var.availability_zone
  root_block_device {
    volume_type           = var.rootblockdevice_volume_type
    volume_size           = var.rootblockdevice_volume_size
    delete_on_termination = var.rootblockdevice_delete_on_termination
  }
  vpc_security_group_ids = [aws_security_group.secgroup_server.id]
  user_data               = lookup(var.user_data, count.index)
  tags = {
    Environment = var.tag_environment
    Region      = var.tag_region
    AZ          = var.tag_az
    Categories  = var.tag_category
    Name        = lookup(var.tag_name, count.index)
    Zone        = var.tag_zone
    Module      = var.tag_module
    Billing     = var.tag_billing
  }
}

output "aws_instance_labserver_ip" {
  value = {
    for instance in aws_instance.labserver:
    instance.id => instance.public_ip
  }
}