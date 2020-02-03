resource "azurerm_public_ip" "labpublicip" {
    name     = var.publicip_name
    location = var.location_name
    resource_group_name          = azurerm_resource_group.labrscgrp.name
    allocation_method            = var.publicip_allocation
    tags = {
        Environment = var.tag_environment
        Location    = var.tag_location
        Categories  = var.tag_category
        Name        = var.tag_plcip
        Zone        = var.tag_zone
        Module      = var.tag_module
        Billing     = var.tag_billing
    }
}