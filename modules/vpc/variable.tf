variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
}

variable "availability_zone" {
  description = "Availability Zone for the subnets"
}

