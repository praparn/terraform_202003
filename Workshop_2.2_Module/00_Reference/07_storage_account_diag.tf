resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = azurerm_resource_group.labrscgrp.name
    }
    
    byte_length = 8
}

resource "azurerm_storage_account" "labstoacc" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name         = azurerm_resource_group.labrscgrp.name
    location                    = var.location_name
    account_replication_type    = var.accreptype
    account_tier                = var.acctier

    tags = {
        Environment = var.tag_environment
        Location    = var.tag_location
        Categories  = var.tag_category
        Name        = "diag${random_id.randomId.hex}"
        Zone        = var.tag_zone
        Module      = var.tag_module
        Billing     = var.tag_billing
    }
}