# The provider on which the Landscape is deployed
provider "aws" {
    profile = "default"
    region  = var.provider_region
}


# -> Creating a VPC for the test test landscape
resource "aws_vpc" "VPC_main" {
  cidr_block       = "10.0.0.0/16"                # -> the VPC CIDR block

  tags = {
    Name    = "AWS_Landscape_POC"
    Comment = ""
    contact = ""
  }
}

module "aws_poc_landscape" {
  source = "../aws2202_poc_landscape"             # -> the directory where the resources are located 
  provider_region = "eu-central-1"
  vpc_id = aws_vpc.VPC_main.id                    # -> the ID of the resource created 
  #vpc_nw_ip = "10.235.0.0/24"                     # -> the VPC IP 
  availability_zone = "eu-central-1a"             # -> the avalaibbilty zone where the resources are deployed 
  subnet_nw_ip = ["10.0.1.0/24", "10.0.2.0/24"]   # -> the subnets deployed in the VPC   
  nw_if_ip = ["10.0.1.50", "10.0.2.50"]           # -> the network interface and elastic IPs assigned to the EC2 instances
  ami_id = "ami-0a6dc7529cd559185"                # -> the machine image used for EC2 instances 
}
