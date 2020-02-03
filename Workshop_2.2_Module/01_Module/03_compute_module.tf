  module "linuxservers" {
    source                        = "Azure/compute/azurerm"
    resource_group_name           = azurerm_resource_group.labrscgrp.name
    location                      = var.location_name
    vm_hostname                   = var.vm_hostname
    nb_public_ip                  = var.nb_public_ip
    remote_port                   = var.remote_port
    ssh_key                       = "./terraformlab.pub"
    nb_instances                  = "1"
    vm_os_publisher               = "Canonical"
    vm_os_offer                   = "UbuntuServer"
    vm_os_sku                     = "14.04.2-LTS"
    vnet_subnet_id                = module.network.vnet_subnets[0]
    boot_diagnostics              = "true"
    delete_os_disk_on_termination = "true"
    data_disk                     = "true"
    data_disk_size_gb             = "8"
    data_sa_type                  = "Premium_LRS"
    public_ip_dns                 = [var.public_ip_dns]
    vm_size                       = var.vm_size

    tags = {
      environment = "dev"
      costcenter  = "it"
    }

    enable_accelerated_networking = "false"
  }

  output "linux_vm_id"{
    value = "${module.linuxservers.vm_ids}"
  }

  output "linux_vm_public_name"{
    value = "${module.linuxservers.public_ip_dns_name}"
  }