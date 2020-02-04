rscgrp_name = "labresourcegroup-student-X"
vm_hostname = "labserver-student-X"
modulenetwork_allowssh = "true"
public_ip_dns = "labserver202003-thailand-student-X-${lower(random_id.vm-sa.hex)}"
nb_public_ip = 1
remote_port = "22"
ossimple = "UbuntuServer"
location_name = "southeastasia"
admin_username = "ubuntu"
vm_size = "Standard_B1s"
tag_environment = "rd"
tag_location = "southeastasia"
tag_category = "network"
tag_rscgrp = "labresourcegroup-student-X"
tag_zone = "none"
tag_module = "network"
tag_billing = "terraform-workshop"
tag_category_linux = "linux"
ssh_key = "./terraformlab.pub"
enable_accelerated_networking = false
nb_instances = 1
boot_diagnostics = true
delete_os_disk_on_termination = true
data_disk = true
data_disk_size_gb = 2
data_sa_type = "Premium_LRS"
vm_os_sku = "18.04-LTS"
vm_os_offer = "UbuntuServer"
vm_os_publisher = "Canonical"
custom_data = <<-EOF
                #!/bin/bash
                curl https://raw.githubusercontent.com/praparn/sourcesetup/master/standard_docker_aws.sh > /tmp/setup.sh
                chmod +x /tmp/setup.sh
                /tmp/setup.sh
EOF