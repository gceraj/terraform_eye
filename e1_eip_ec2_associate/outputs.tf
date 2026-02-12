#output "sg_id" {
#  value       = aws_security_group.gceraj_kube_sg.id
#  description = "VPC ID: "
#}

#output "public_ip" {
#  description = "public ip of the EC2 instance."
#  value       = aws_instance.bull_instance_kube_master.public_ip
#}