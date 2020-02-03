resource "azurerm_network_interface" "labnicint" {
    name                        = var.nicintname
    location                    = var.location_name
    resource_group_name         = azurerm_resource_group.labrscgrp.name
    network_security_group_id   = azurerm_network_security_group.labsecgrp.id

    ip_configuration {
        name                          = var.nicintname
        subnet_id                     = azurerm_subnet.labsubnet.id
        private_ip_address_allocation = var.privateip_allocation
        public_ip_address_id          = azurerm_public_ip.labpublicip.id
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