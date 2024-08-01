output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "The ID of the first subnet"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.codev-security-group.id
}
