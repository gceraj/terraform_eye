globals = {
  environment          = "prod"
  project              = "eye"
  vpc_1_cidr_block     = "10.0.0.0/16"
  vpc_1_name           = "gceraj-vpc"
  vpc_1_subnet_1_block = "10.0.1.0/24"
  vpc_1_subnet_1_name  = "subnet_1"
  sg_1_name            = "kube-security-group"
  tags = {
    owner = "pakkiaraj"
    team  = "data-eng"
  }
}

