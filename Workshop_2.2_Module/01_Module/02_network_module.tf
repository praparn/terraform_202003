module "network" {
    source              = "Azure/network/azurerm"
    version             = "~> 1.1.1"
    location            = var.location_name
    allow_ssh_traffic   = var.modulenetwork_allowssh
    resource_group_name = azurerm_resource_group.labrscgrp.name
  }