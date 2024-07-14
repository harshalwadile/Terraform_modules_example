output "public1_security_group_id" {
  value = aws_security_group.public.id
}

output "private1_security_group_id" {
  value = aws_security_group.private.id
}
