terraform {
  required_version = ">= 0.12"
}

#     Elsatic IP attacked to the Network Interfaces
resource "aws_eip" "lb" {
  associate_with_private_ip = var.nw_if_ip[0]      # -> Private IP associated to the netowrk interface
  network_interface = aws_network_interface.public_nw_interface.id
  vpc      = true
  #depends_on = [aws_internet_gateway.gw]

}

#     Elastic IP attched to the NAT gateway 
resource "aws_eip" "nat" {
  
  vpc      = true
  associate_with_private_ip = var.nw_if_ip[1]
  depends_on = [aws_internet_gateway.gw]

}