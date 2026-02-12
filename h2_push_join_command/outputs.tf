# output "instance_id" {
#   value       = aws_instance.bull_instance_kube_master.id
#   description = "ID"
# }
# 
# output "public_ip" {
#   description = "public ip of the EC2 instance."
#   value       = aws_instance.bull_instance_kube_master.public_ip
# }
# 
# output "join_command" {
#   value = data.external.kubeadm_join.result
# }
