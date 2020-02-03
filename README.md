##############################################################################################################################
How to Run this script:
##############################################################################################################################

1. Folder Structure:

    UAT-|
        |--0.IAM (Set Credential and Standard User)
        |--1.Network (Initial VPC, Subnet, Internet GW, NAT GW, Route Table etc)
        |--2.Instance (EC2 Instance)
            |--00_Standard_EC2 (Standard Security Group, IAM Role, Key Pair for EC2 )
            |--01_JumpSVR_Linux (JumpServer EC2)
            |--02_Jenkin_Master (Jenkins Master EC2)
            |--03_Jenkin_Slave (Jenkins Slave EC2)
            |--04_CMS_Build_Server (CMS and Build Server on EC2)
            |--05_Kubernetes_Farm (Set of K8S Farm on EC2)
        |--3.Database (Mysql and Redis)
            |--01_Mysql_RDS (Mysql Instance)
            |--02_Elastic_RDS (ElasticSearch Instance)
        |--99.Test_Module (R&D)
        |--global_variable.auto.tfvars (This is global variable that system generate don't touch)

    SIT-|
        |--0.IAM (Set Credential and Standard User)
        |--1.Network (Initial VPC, Subnet, Internet GW, NAT GW, Route Table etc)
        |--2.Instance (EC2 Instance)
            |--00_Standard_EC2 (Standard Security Group, IAM Role, Key Pair for EC2 )
            |--01_JumpSVR_Linux (JumpServer EC2)
            |--02_Jenkin_Master (Jenkins Master EC2)
            |--03_Jenkin_Slave (Jenkins Slave EC2)
            |--04_CMS_Build_Server (CMS and Build Server on EC2)
            |--05_Kubernetes_Farm (Set of K8S Farm on EC2)
        |--3.Database (Mysql and Redis)
            |--01_Mysql_RDS (Mysql Instance)
            |--02_Elastic_RDS (ElasticSearch Instance)
        |--99.Test_Module (R&D)
        |--global_variable.auto.tfvars (This is global variable that system generate don't touch)

    PRD-|
        |--0.IAM (Set Credential and Standard User)
        |--1.Network (Initial VPC, Subnet, Internet GW, NAT GW, Route Table etc)
        |--2.Instance (EC2 Instance)
            |--00_Standard_EC2 (Standard Security Group, IAM Role, Key Pair for EC2 )
            |--01_JumpSVR_Linux (JumpServer EC2)
            |--02_Jenkin_Master (Jenkins Master EC2)
            |--03_Jenkin_Slave (Jenkins Slave EC2)
            |--04_CMS_Build_Server (CMS and Build Server on EC2)
            |--05_Kubernetes_Farm (Set of K8S Farm on EC2)
        |--3.Database (Mysql and Redis)
            |--01_Mysql_RDS (Mysql Instance)
            |--02_Elastic_RDS (ElasticSearch Instance)
        |--99.Test_Module (R&D)
        |--global_variable.auto.tfvars (This is global variable that system generate don't touch)

2. File component on each section
    2.1 Variable configuration: "terraform.tfvars"
    2.2 Create Object via Script: "start_terraform.sh"
    2.3 Destroy Object via Script: "destroy_terraform.sh"
    2.4 Automate Option: (Make sure that all variable was configure before operate)
        2.4.1 Automate Create all EC2 Instance Script: "start_ec2_terraform_all.sh"
        2.4.2 Destroy all EC2 Instance Script: "destroy_ec2_terraform_all.sh"
    2.5 Log file: path /log in each module


3. Sequence to Create AWS
    3.1 Option1: If you already setup all IAM role / user / group. You can continute on
        3.1.1 Network
            3.1.1.1 Setup variable on "terraform.tfvars"
            3.1.1.1 Run script "start_terraform.sh"
            3.1.1.1 Check result from "/log"
        3.1.2 Instance
            3.1.2.1 Setup variable on "terraform.tfvars" on all sub folder of "2.Instance"
            3.1.2.2 Create by Automate
                - Run script "start_ec2_terraform_all.sh"
                - Check result from "/log" on each subfolder
            
                *Remark: 
                    - In case we need to create step-by-step. You can access to each folder and run "start_terraform.sh" for operate
                    - Under folder: "00_Standard_EC2" also give your chance to generate key pair for use with EC2 instance via interactive command

        3.1.3.RDS
            3.1.3.1 Setup variable on "terraform.tfvars"
            3.1.3.2 Run script "start_terraform.sh"
            3.1.3.3 Check result from "/log"

    3.2 Option2: Scratch
        3.2.1.IAM (Run only first time only)
            3.2.1.1 Setup variable on "terraform.tfvars"
            3.2.1.2 Run script "start_terraform.sh"
            3.2.1.3 Check result from "/log"
        3.2.1 Network
            3.2.1.1 Setup variable on "terraform.tfvars"
            3.2.1.1 Run script "start_terraform.sh"
            3.2.1.1 Check result from "/log"
        3.2.2 Instance
            3.2.2.1 Setup variable on "terraform.tfvars" on all sub folder of "2.Instance"
            3.2.2.2 Create by Automate
                - Run script "start_ec2_terraform_all.sh"
                - Check result from "/log" on each subfolder
            
                *Remark: 
                    - In case we need to create step-by-step. You can access to each folder and run "start_terraform.sh" for operate
                    - Under folder: "00_Standard_EC2" also give your chance to generate key pair for use with EC2 instance via interactive command

        3.2.3.RDS
            3.2.3.1 Setup variable on "terraform.tfvars"
            3.2.3.2 Run script "start_terraform.sh"
            3.2.3.3 Check result from "/log"   


4. Sequence Roll Back AWS
    4.1 Individual component rollback
        4.1 Run "destroy_terraform.sh" on each module you need to destroy
        4.2 Check result via AWS Web / Console Log
    
    4.2 Entire rollback
        4.2.1 RDS: Run script "destroy_terraform.sh"
        4.2.2 Instance: Run script "destroy_ec2_terraform_all.sh"
        4.2.3 Network: Run script "destroy_terraform.sh"
        4.2.4 IAM: Not require


###############################################################################################################################
Standard Format Instruction:
###############################################################################################################################

0. IAM for Apply Terraform:
    0.1 Standard User:
        Root ==> Create User: Terraform with Access Key/Secret Key:
        terraform ==> For execute Terraform
        <env>admin ==> For administrator of account
        <env>read  ==> For readonly user of account

    0.2 Standard Group:
        admin:          Full Administrator Access:          AttachPolicy: AdministratorAccess
        terraform:      Role for terraform running          AttachPolicy: AdministratorAccess
        readonly:       Role for readonly all resource:     AttachPolicy: ReadOnlyAccess


1. Network Range:
Zone: X.X.X.X/X 
#Major Avaliability Zone: 1A#
        Private_1A: 
                NET:  (Reserved)
                BC:  (Reserved)
                Range:  (Avaliable:59 IP)
                AWS Reserved: X.X.X.1 (Gateway), X.X.X.X (DNS), X.X.X.3 (Reserve for AWS)       
        
        Public_1A: 
                NET:  (Reserved)
                BC:  (Reserved)
                Range:  (Avaliable:59 IP)
                AWS Reserved: X.X.X.1 (Gateway), X.X.X.X (DNS), X.X.X.3 (Reserve for AWS) 

#Spare Avaliability Zone: 1B#
        Private_1B: 
                NET:  (Reserved)
                BC:  (Reserved)
                Range:  (Avaliable:59 IP)
                AWS Reserved: X.X.X.1 (Gateway), X.X.X.X (DNS), X.X.X.3 (Reserve for AWS) 

        Public_1B: 
                NET:  (Reserved)
                BC:  (Reserved)
                Range:  (Avaliable:59 IP)
                AWS Reserved: X.X.X.1 (Gateway), X.X.X.X (DNS), X.X.X.3 (Reserve for AWS) 


2. Route53 Host Zone:
    UAT Environment:        company.uat
    STAGING Environment:    company.prd
    PRD Environment:        company.local

3. Standard Tag:
    Environment:            dev/sit/uat/staging/prd/dr/other
    Region:                 ap-southeast-1
    AZ:                     ap-southeast-1a/ap-southeast-1b/ap-southeast-1c/none
    Category:               network/iam/compute/storage
    Name:                   company-<env>-<category>-<shortname>
    Zone:                   public/private/none (for network)
    Module:                 <Module Name>/none (for network)
    ฺBilling:                <Projectname>/BAU
    KubernetesCluster:      Kubernetes Cluster Name

    ################################################################
    #                           Template                           #
    ################################################################
tags {
    Environment     = "${var.tag_xxxxxx}"
    Region          = "${var.tag_xxxxxx}"
    AZ              = "${var.tag_xxxxxx}"
    Categories      = "${var.tag_xxxxxx}"
    Name            = "${var.tag_xxxxxx}"
    Zone            = "${var.tag_xxxxxx}"
    Module          = "${var.tag_xxxxxx}"
  }

    ################################################################
    #                   Standard Name Variable                     #
    ################################################################
     Nameing Variable:       tag_<objectname>_<standardtag>

4. Standard Output:
    4.1 Output for Network:
        IAM Module:
        iamuser_terraform_username
        iamuser_terraform_secret
        iamuser_terraform_id
        iamuser_terraform_password
        iamuser_admin_username
        iamuser_admin_secret
        iamuser_admin_id
        iamuser_admin_password
        iamuser_readonly_username
        iamuser_readonly_secret
        iamuser_readonly_id
        iamuser_readonly_password

        Network Module:
        vpc_id
        vpc_cidr
        route53_zoneid
        igw_id
        subnet_publicuat_1a
        subnet_privateuat_1a
        eipnatuat_1a
        eipnatuat_1b
        eipnatuat_1c
        eipinterfaceuat1_1a
        eipinterfaceuat2_1a
        eipinterfaceuat3_1a
        natgwuat_1a
        rtb_private
        rtb_public


5. Standard Eleastic IP Address:
    5.1 Elastic IP Address for NAT Gateway
        - 1 EIP per AZ
    5.2 Elastic IP Address for Assiciate with Private IP (Public Zone)
        - 3 EIP per AZ
        - 3 Private IP Address per AZ to Provide

6. Standard Security Group:
    6.1 Jump Server:
        Name: secgroup_jumpsvr
        - Inbound:
            - Source: Any, Service: SSH (TCP-22)
            - Source: Any, Service: 3389 (TCP-3389)
            - Source: x.x.x.x, Service: Any
        - Outbound:
            - Destination: Any, Service: Any
    
    6.2 Jenkin:
        Name: secgroup_jenkin
        - Inbound:
            - Source: x.x.x.x, Service: HTTPS (TCP-443)
            - Source: x.x.x.x, Service: HTTP (TCP-80)
            - Source: x.x.x.x, Service: 8080 (TCP-8080)
            - Source: x.x.x.x, Service: SSH (TCP-22)
        - Outbound:
            - Destination: Any, Service: Any
    
    6.3 Kubernetes:
        Name: secgroup_kubernetes
        - Inbound:
            - Source: x.x.x.x, Service: SSH (TCP-22)
            - Source: x.x.x.x, Service: HTTP (TCP-80)
            - Source: x.x.x.x, Service: HTTPS (TCP-443)
            - Source: x.x.x.x, Service: TCP-6443
            - Source: x.x.x.x, Service: TCP-2379-2380
            - Source: x.x.x.x, Service: TCP-10250-10252
            - Source: x.x.x.x, Service: TCP-10255
            - Source: x.x.x.x, Service: TCP-30000-32767
        - Outbound:
            - Destination: Any, Service: Any
    
    6.4 CMS:
        Name: secgroup_cms
        - Inbound:
            - Source: x.x.x.x, Service: SSH (TCP-22)
            - Source: x.x.x.x, Service: HTTP (TCP-80)
            - Source: x.x.x.x, Service: 8080 (TCP-8080)
        - Outbound:
            - Destination: Any, Service: Any

7. Standard IAM Role/Policy/Profile:
    7.1 EC Role:
        Name:iamrole_ec2
        "Statement": [
            {
            "Action": "sts:AssumeRole",
            "Principal": {
            "Service": "ec2.amazonaws.com"
                        },
            "Effect": "Allow",
            "Sid": ""
            }
        ]

    7.2 EC2 Policy Stanard:
        Name:iampolicy_ec2
            {
            "Version": "2012-10-17",
            "Statement": [
            {
            "Action": [
                    "ec2:Describe*"
                        ],
            "Effect": "Allow",
            "Resource": "*"
            }      

    7.3 EC2 Instance Profile:
        Name:iaminstanceprofile_ec2

8. Key Pair:
    Name: keypair
    Primary Key: Fill In: ==> Export to Environment TF_VAR_public_key

9. Server Naming Standard: 
    company_<env>_<module>_<number>