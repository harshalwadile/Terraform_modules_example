provider "aws" {
  region = "us-east-1"  # Update with your desired region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block            = "10.0.0.0/16"
  public_subnet_cidr_block  = "10.0.1.0/24"
  private_subnet_cidr_block = "10.0.2.0/24"
  availability_zone         = "us-east-1a"  # Update with your desired AZ
}

module "security_group" {
  source = "./modules/security_group"

  vpc_id = module.vpc.vpc_id
}

module "instance" {
  source = "./modules/instance"

  ami_id                     = "ami-12345678"  # Replace with your AMI ID
  instance_type              = "t2.micro"      # Replace with your instance type
  public_security_group_id   = module.security_group.public_security_group_id
  private_security_group_id  = module.security_group.private_security_group_id
}

