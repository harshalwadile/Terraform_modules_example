resource "aws_instance" "public" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  security_groups        = [var.public_security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "Public Instance"
  }
}

resource "aws_instance" "private" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  security_groups        = [var.private_security_group_id]

  tags = {
    Name = "Private Instance"
  }
}
output "public_instance_id" {
  value = aws_instance.public.id
}

output "private_instance_id" {
  value = aws_instance.private.id
}
