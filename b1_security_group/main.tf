
resource "aws_security_group" "gceraj_kube_sg" {
  name        = "kube-security-group"
  description = "Security group for Kubernetes nodes"
  vpc_id      = var.vpc_1_id

  tags = {
    Name = "gceraj-kube-sg"
  }
}
