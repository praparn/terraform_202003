resource "azurerm_network_security_group" "labsecgrp" {
    name                = var.secgrpname
    location            = var.location_name
    resource_group_name = azurerm_resource_group.labrscgrp.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        Environment = var.tag_environment
        Location    = var.tag_location
        Categories  = var.tag_category
        Name        = var.tag_secgrp
        Zone        = var.tag_zone
        Module      = var.tag_module
        Billing     = var.tag_billing
    }
}