variable "ami_id" {
  description = "AMI ID for the instances"
}

variable "instance_type" {
  description = "Instance type"
}

variable "public_security_group_id" {
  description = "ID of the security group for public instances"
}

variable "private_security_group_id" {
  description = "ID of the security group for private instances"
}

