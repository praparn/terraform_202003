  module "linuxservers" {
    source                        = "Azure/compute/azurerm"
    resource_group_name           = azurerm_resource_group.labrscgrp.name
    location                      = var.location_name
    vm_hostname                   = var.vm_hostname
    nb_public_ip                  = var.nb_public_ip
    remote_port                   = var.remote_port
    ssh_key                       = var.ssh_key
    nb_instances                  = var.nb_instances
    vm_os_publisher               = var.vm_os_publisher
    vm_os_offer                   = var.vm_os_offer
    vm_os_sku                     = var.vm_os_sku
    vnet_subnet_id                = module.network.vnet_subnets[0]
    boot_diagnostics              = var.boot_diagnostics
    delete_os_disk_on_termination = var.delete_os_disk_on_termination
    data_disk                     = var.data_disk
    data_disk_size_gb             = var.data_disk_size_gb
    data_sa_type                  = var.data_sa_type
    public_ip_dns                 = [var.public_ip_dns]
    vm_size                       = var.vm_size
    custom_data                   = var.custom_data
    admin_username                = var.admin_username

    tags = {
      Environment = var.tag_environment
      Location    = var.tag_location
      Categories  = var.tag_category_linux
      Name        = var.vm_hostname
      Zone        = var.tag_zone
      Module      = var.tag_module
      Billing     = var.tag_billing
    }

    enable_accelerated_networking = var.enable_accelerated_networking
  }

  output "linux_vm_id"{
    value = "${module.linuxservers.vm_ids}"
  }

  output "linux_vm_public_name"{
    value = "${module.linuxservers.public_ip_dns_name}"
  }