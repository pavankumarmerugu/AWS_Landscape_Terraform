terraform {
  required_version = ">= 0.12"
}

#.......... Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "AWS_Internet_Gateway"
  }
}


# ..........NAT Gateway (attached to public subnet)
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.AWS_public_subnet.id

  tags = {
    Name = "gw NAT"
  }
}