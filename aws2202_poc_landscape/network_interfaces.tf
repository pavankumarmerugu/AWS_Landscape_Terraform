terraform {
  required_version = ">= 0.12"
}


#        Network Interface with an IP in the public subnet that was created 

resource "aws_network_interface" "public_nw_interface" {
  subnet_id       = aws_subnet.AWS_public_subnet.id
  private_ips     = [var.nw_if_ip[0]]
  security_groups = [aws_security_group.allow_web.id]

  # attachment {
  #   instance     = aws_instance.Bastion_instance.id
  #   device_index = 1
  # }
}


#        Network Interface with an IP in the private subnet that was created

resource "aws_network_interface" "private_nw_interface" {
  subnet_id       = aws_subnet.AWS_Private_subnet.id
  private_ips     = [var.nw_if_ip[1]]
  security_groups = [aws_security_group.allow_SSH.id]

  # attachment {
  #   instance     = aws_instance.private_instance.id
  #   device_index = 1
  # }
}