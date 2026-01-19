

module "vpc" {
  source  = "../../a1_vpc"
  globals = var.globals
}

module "security_group" {
  source  = "../../b1_security_group"
  globals = var.globals
  vpc_1_id = module.vpc.vpc_1_id
}


