variable provider_region {
  type        = string
  #default     = ""
  description = "The providers region"
}

variable vpc_id {
  type        = string
  #default     = ""
  description = "The providers VPC"
}

variable availability_zone {
  type        = string
  default     = ""
  description = "The availabilty zone in ehich the landsape is deployed"
}

# Network
variable vpc_nw_ip {
  type        = string
  default     = ""
  description = "VPC cidr block"
}

variable subnet_nw_ip {
  type        = list
  #default     = ""
  description = "Subnet cidr block"
}


variable nw_if_ip {
  type        = list
  #default     = ""
  description = "Network interface private IP"
}

#EC2 instance
variable ami_id {
  type        = string
  #default     = ""
  description = "The AMI Id to be used for the Ec2 instances"
}
