globals = {
  environment          = "prod"
  project              = "eye"
  vpc_1_cidr_block     = "10.0.0.0/16"
  vpc_1_name           = "gceraj-vpc"
  vpc_1_subnet_1_block = "10.0.1.0/24"
  vpc_1_subnet_1_name  = "subnet_1"
  sg_1_name            = "kube-security-group"
  ec2_key_name         = "KP_Kubernetes_A_v1"
  ec2_inst_type_master = "t3.small"
  ec2_inst_type_worker = "t3.small"
  ec2_master_inst_name = "gceraj_master"
  tags = {
    owner = "pakkiaraj"
    team  = "data-eng"
  }
}

