resource "azurerm_subnet" "labsubnet" {
    name     = var.vrtsnt_name
    resource_group_name  = azurerm_resource_group.labrscgrp.name
    virtual_network_name = azurerm_virtual_network.labvirtualnetwork.name
    address_prefix       = var.vrtsnt_space
}