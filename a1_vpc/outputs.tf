output "m_vpc_1_id" {
  value       = aws_vpc.vpc_1.id
  description = "VPC ID: "
}

output "m_subnet_1_id" {
  value       = aws_subnet.public.id
  description = "Subnet  ID"
}
