output "instance_id" {
  value       = aws_instance.bull_instance_kube_worker.id
  description = "ID"
}

output "public_ip" {
  description = "public ip of the EC2 instance."
  value       = aws_instance.bull_instance_kube_worker.public_ip
}

