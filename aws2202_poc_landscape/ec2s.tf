terraform {
  required_version = ">= 0.12"
}



#.......... Bastion Ubuntu server 

resource "aws_instance" "Bastion_instance" {
    ami = var.ami_id
    instance_type = "t2.micro"
    availability_zone = var.availability_zone
    key_name = "main-key"
    # user_data = <<-EOF
    #         #! /bin/bash
    #         sudo apt-get update
    #         sudo apt-get install apache2 -y
    #         sudo systemctl start apache2
    #         sudo systemctl enable apache2
    #         sudo bash -c 'echo Deployed via Terraform. This is my first terraform code > /var/www/html/index.html'
	#         EOF


    network_interface {
        device_index = 0
        network_interface_id = aws_network_interface.public_nw_interface.id
    }
    
    
    tags = {
		Name = "Bastion instance"			
	}
    

}

#..........private Ubuntu server for SSH access

resource "aws_instance" "private_instance" {
    ami = var.ami_id
    instance_type = "t2.micro"
    availability_zone = var.availability_zone
    key_name = "main-key"
    network_interface {
        device_index = 0
        network_interface_id = aws_network_interface.private_nw_interface.id
    }
    
    
    tags = {
		Name = "private instance"			
	}
    

}