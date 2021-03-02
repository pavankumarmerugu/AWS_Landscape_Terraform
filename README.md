# AWS POC Landscape

This terraform script automates an AWS infrastructure Landscape for the test deployments.

The following modules are deployed through the terraform scripts in this repository 

* VPC 
* Subnets (Private and public subnet)
* Internet Gateway
* Network Interface
* Route tables
* Security groups
* Elastic IPs
* EC2 instances 

## Directory structure ## 

### The following files are created as part of deployment ###

* The directory modules-2202 contains the file,
    - __main.tf__ - the main configuration file which contains the modules to start the terraform script and configure   infrastructure resources 
* The directory AWS_poc_landscape contains the files,
    - __ec2s.tf__ – contains terraform code to create the EC2 instances (Bastion host and private instance) 
        - __Bastion host__ – is the jump host through which one can login to Private instance and is deployed in public subnet 
        - __Private instance__ – the EC2 instance deployed in private subnet 
    - __internet_nat_gateway.tf__ – the code to deploy internet gateway for VPC network and nat gateway for public subnet
    - __route_tables.tf__ – The routing table for public and private subnets
    - __security_groups.tf__ - defines security groups for the public and private subnets 
    - __subnets.tf__ - create public and private subnets in the landscape 
    - __variables.tf__ – defines the variables that needs to declared and initialized   
    - __eip.tf__ – creates the elastic IPs for the instances that are deployed in the subnets
    - __network_interfaces.tf__ – network interfaces deployed for the public and private subnets 

## Terraform Landscape deployment  ##

* In __main.tf__ file located under __modules-2202__ directory, the profile of the provider needs to be configured to deploy the test landscape
    provider "aws" {
        profile = " " *** -> AWS access key needs to be configured to initialize the scripts ***
        region = var.provider_region
    }

* The following variables are required to be initialized to deploy test landscape under the modules section in __main.tf__ file

    - __source__ = " "   *** -> the directory where the resources to be deployed are located ***

    - __provider_region__ = "  " -> the region where the test landscape needs to be deployed
        - __Example:__ “eu-central-1”

    - __vpc_id__ = aws_vpc.VPC_main.id   -> the ID of the VPC resource created 

    - __availability_zone__ = "  "   -> the avalaibbilty zone where the resources are deployed 
	    - __Example__: “eu-central-1a”

    - __subnet_nw_ip__ = [" IP1, IP2"]   # -> the public and private subnets IPs deployed for the VPC   
        - __Example:__ [“10.0.1.0/24”, 10.0.2.0/24]
	
    - __nw_if_ip__ = ["IP1, IP2”]    -> the network interface and elastic IPs assigned to the EC2 instances
        - __Example:__ [“10.0.1.50”, “10.0.2.50”]

    - __ami_id__ = "  "   -> the machine image used for private and public EC2 instances
        - __Example:__ “ami-0a6dc7529cd559185”]


