instance_type = {
    "nginx" = "t3a.nano"
    "docker" = "t2.nano"
    "other" = "t3a.nano"
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