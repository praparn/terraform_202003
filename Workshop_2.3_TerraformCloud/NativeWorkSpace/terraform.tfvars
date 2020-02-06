projectname = "TerraformProject202003"
region = "asia-southeast1"
zone = "asia-southeast1-a"
gcompute_network_name = "lab-vpc-student-X"
gcompute_createsubnet = true
compute_name = "lab-computer-student-X"
compute_type = "f1-micro"
image = "ubuntu-1804-lts"
scratch_disk = "SCSI"
disk_size = 8
user_data = <<-EOF
                #!/bin/bash
                curl https://raw.githubusercontent.com/praparn/sourcesetup/master/standard_docker_aws.sh > /tmp/setup.sh
                chmod +x /tmp/setup.sh
                /tmp/setup.sh
EOF
