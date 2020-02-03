resource "azurerm_virtual_network" "labvirtualnetwork" {
    name     = var.vrtnwk_name
    address_space = [var.vrtnwk_space]
    location = var.location_name
    resource_group_name = azurerm_resource_group.labrscgrp.name
    tags = {
        Environment = var.tag_environment
        Location    = var.tag_location
        Categories  = var.tag_category
        Name        = var.tag_vrtnwk
        Zone        = var.tag_zone
        Module      = var.tag_module
        Billing     = var.tag_billing
    }
}