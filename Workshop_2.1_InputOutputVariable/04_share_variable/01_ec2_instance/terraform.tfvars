instance_type = {
    "nginx" = "t3a.nano"
    "docker" = "t2a.nano"
    "other" = "t3a.nano"
}
server_type = "nginx"
keypair = "keypair"
instancecount=2
rootblockdevice_volume_type = "gp2"
rootblockdevice_volume_size = 10
rootblockdevice_delete_on_termination = true
tag_environment="rd"
tag_region="ap-southeast-1"
tag_az="ap-southeast-1a"
tag_category="compute"
tag_name={
    "0"    = "labresource-server1-student-X"
    "1"    = "labresource-server2-student-X"
}
tag_zone="public"
tag_module="ec2"
tag_billing="terraform-workshop"

user_data = {
    "0" = <<-EOF
                #!/bin/bash
                curl https://raw.githubusercontent.com/praparn/sourcesetup/master/standard_nginx.sh > /tmp/setup.sh
                chmod +x /tmp/setup.sh
                /tmp/setup.sh
                EOF
    "1"= <<-EOF
                #!/bin/bash
                curl https://raw.githubusercontent.com/praparn/sourcesetup/master/standard_docker_aws.sh > /tmp/setup.sh
                chmod +x /tmp/setup.sh
                /tmp/setup.sh
                EOF
}