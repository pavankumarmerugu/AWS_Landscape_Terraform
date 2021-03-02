terraform {
  required_version = ">= 0.12"
}

#.........  Route Table (public)

resource "aws_route_table" "Public_route_table" {
  vpc_id            = var.vpc_id

  route {
    cidr_block      = "0.0.0.0/0" # Route all traffic to the Internet Gateway
    gateway_id      = aws_internet_gateway.gw.id
  }

#   route {
#     ipv6_cidr_block        = "::/0"
#     egress_only_gateway_id = aws_internet_gateway.gw.id
#   }

  tags = {
    Name            = "Public-route-table"
  }
}

#........ Route Table (private)

resource "aws_route_table" "Private_route_table" {
  vpc_id            = var.vpc_id

  route {
    cidr_block      = "0.0.0.0/0" #route through NAT Gateway
    gateway_id      = aws_nat_gateway.nat-gw.id
  }

#  route {
#     ipv6_cidr_block        = "::/0"
#     egress_only_gateway_id = aws_internet_gateway.gw.id
#   }

  tags = {
    Name            = "private-route-table"
  }
}

# ......... Associate subnet with Route Table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.AWS_public_subnet.id
  route_table_id = aws_route_table.Public_route_table.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.AWS_Private_subnet.id
  route_table_id = aws_route_table.Public_route_table.id
}
