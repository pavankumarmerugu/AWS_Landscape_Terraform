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

Directory structure 

## The following files are created as part of deployment 

* The directory modules-2202 contains the file,
    - __main.tf__ - the main configuration file which contains the modules to start the terraform script and configure   infrastructure resources 
* The directory AWS_poc_landscape contains the files,
    - __ec2s.tf__ – contains terraform code to create the EC2 instances (Bastion host and private instance) 
        - __Bastion host__ – is the jump host through which one can login to Private instance and is deployed in public subnet 
        - __Private instance__ – the EC2 instance deployed in private subnet 
    - __internet_nat_gateway.tf – the code to deploy internet gateway for VPC network and nat gateway for public subnet
    - __route_tables.tf__ – The routing table for public and private subnets
    - __security_groups.tf__ - defines security groups for the public and private subnets 
    - __subnets.tf__ - create public and private subnets in the landscape 
    - __variables.tf__ – defines the variables that needs to declared and initialized   
    - __eip.tf__ – creates the elastic IPs for the instances that are deployed in the subnets
    - __network_interfaces.tf__ – network interfaces deployed for the public and private subnets 