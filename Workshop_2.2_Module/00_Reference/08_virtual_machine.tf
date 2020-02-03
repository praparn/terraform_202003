resource "azurerm_virtual_machine" "labvm" {
    name                  = var.vmname
    location              = var.location_name
    resource_group_name   = azurerm_resource_group.labrscgrp.name
    network_interface_ids = [azurerm_network_interface.labnicint.id]
    vm_size               = var.vmsize

    storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = var.vmname
        admin_username = "ubuntu"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/ubuntu/.ssh/authorized_keys"
            key_data = var.keydata
        }
    }

    boot_diagnostics {
        enabled     = "true"
        storage_uri = azurerm_storage_account.labstoacc.primary_blob_endpoint
    }

    tags = {
        Environment = var.tag_environment
        Location    = var.tag_location
        Categories  = var.tag_category
        Name        = "diag${random_id.randomId.hex}"
        Zone        = var.tag_zone
        Module      = var.tag_modulevm
        Billing     = var.tag_billing
    }
}