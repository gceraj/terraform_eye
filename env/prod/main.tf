

module "vpc" {
  source  = "../../a1_vpc"
  globals = var.globals
}

module "security_group" {
  source   = "../../b1_security_group"
  globals  = var.globals
  vpc_1_id = module.vpc.m_vpc_1_id
}

module "ec2_image" {
  source  = "../../c1_ec2_image"
  globals = var.globals
}

module "ec2_instance" {
  source      = "../../d1_ec2_instance"
  globals     = var.globals
  sg_id       = module.security_group.m_sg_id
  image_1_id  = module.ec2_image.m_image_id
  subnet_1_id = module.vpc.m_subnet_1_id
}



