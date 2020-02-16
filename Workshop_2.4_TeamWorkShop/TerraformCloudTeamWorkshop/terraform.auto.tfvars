instance_type = {
    "nginx" = "t2.nano"
    "docker" = "t2.nano"
    "other" = "t2.nano"
}

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