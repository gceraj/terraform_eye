

#output "m_image_id" {
#  description = "Ubuntu 24.04 image id:"
#  value       = module.ec2_image.m_image_id
#}

output "o_eip_address" {
  description = "Elastic IP Address:"
  value       = module.eip.elastic_ip_name_oupt
}

output "o_instance_public_ip_w2" {
  description = "public ip of the EC2 instance."
  value       = module.ec2_instance_worker.public_ip
}

#output "o_get_join_command" {
#  value       = module.get_join_command.join_command
#}
