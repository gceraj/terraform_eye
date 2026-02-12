output "elastic_ip_name_oupt" {
  value       = data.aws_eip.by_allocation_id.public_ip
  description = "elastic IP: "
}

output "elastic_ip_id" {
  #  value       = aws_eip.eip_bull.id
  value       = data.aws_eip.by_allocation_id.id
  description = "ID"
}

