resource "aws_vpc" "main" {

	cidr_block 		= var.vpc_cidr_block
	enable_dns_support 	= true 
	enable_dns_hostnames 	= true
}

resource "aws_subnet" "public" {
	
	vpc_id 			= aws_vpc.main.id
	cidr_block 		= var.public_subnet_cidr_block
	availability_zone 	= var.availabilty_zone
	map_public_ip_on_launch	= true
}

resource "aws_subnet" "private" {

        vpc_id                  = aws_vpc.main.id
        cidr_block              = var.private_subnet_cidr_block
        availability_zone       = var.availabilty_zone
}
resource "aws_internet_gateway" "gw" {
  
	vpc_id = aws_vpc.main.id
}
resource "aws_route_table" "public" {
  
	vpc_id = aws_vpc.main.id

  	route {
    		cidr_block = "0.0.0.0/0"
    		gateway_id = aws_internet_gateway.gw.id
  	}
	tags = {
   	Name = "Public Route Table"
 	}
}
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
output "vpc_id" {
  value = aws_vpc.main.id
}

