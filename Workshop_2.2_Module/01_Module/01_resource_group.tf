resource "azurerm_resource_group" "labrscgrp" {
    name     = var.rscgrp_name
    location = var.location_name
    tags = {
        Environment = var.tag_environment
        Location    = var.tag_location
        Categories  = var.tag_category
        Name        = var.tag_rscgrp
        Zone        = var.tag_zone
        Module      = var.tag_module
        Billing     = var.tag_billing
    }
}

resource "random_id" "dnsname" {
  keepers = {
    vm_hostname = var.vm_hostname
  }

  byte_length = 6
}
