resource "aws_security_group" "secgroup_server1" {
  name        = "securitygroup-server1-student-X"
  description = "security group for web server (nginx)"
  vpc_id      = "vpc-4483e921"
  #Incoming Rule
  #Public IP Rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #Private IP Rule
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [data.aws_vpc.labvpc.cidr_block]
  }
  #Outgoing Rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "rd"
    Region      = "ap-southeast-1"
    AZ          = "none"
    Categories  = "compute"
    Name        = "securitygroup-server1-student-X"
    Zone        = "public"
    Module      = "secgroup"
    Billing     = "terraform-workshop"
  }
}

resource "aws_security_group" "secgroup_server2" {
  name        = "securitygroup-server2-student-X"
  description = "security group for docker server"
  vpc_id      = "vpc-4483e921"
  #Incoming Rule
  #Public IP Rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #Private IP Rule
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [data.aws_vpc.labvpc.cidr_block]
  }
  #Outgoing Rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "rd"
    Region      = "ap-southeast-1"
    AZ          = "none"
    Categories  = "compute"
    Name        = "securitygroup-server2-student-X"
    Zone        = "public"
    Module      = "secgroup"
    Billing     = "terraform-workshop"
  }
}