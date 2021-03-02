terraform {
  required_version = ">= 0.12"
}

#.......... public subnet 
resource "aws_subnet" "AWS_public_subnet" {
  vpc_id           = var.vpc_id
  cidr_block       = var.subnet_nw_ip[0]
  availability_zone = var.availability_zone

  tags = {
    Name           = "AWS_Public_Subnet"
  }
}

#..........  private subnet 
resource "aws_subnet" "AWS_Private_subnet" {
  vpc_id           = var.vpc_id
  cidr_block       = var.subnet_nw_ip[1]
  availability_zone = var.availability_zone

  tags = {
    Name           = "AWS_Private_Subnet"
  }
}