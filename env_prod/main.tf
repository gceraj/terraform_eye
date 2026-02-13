module "eip" {
  source  = "../a2_elastic_ip"
  globals = var.globals
}

module "vpc" {
  source  = "../a1_vpc"
  globals = var.globals

  depends_on = [module.eip]
}

module "roles" {
  source  = "../a3_roles"
  globals = var.globals

  depends_on = [module.vpc]
}


module "security_group" {
  source   = "../b1_security_group"
  globals  = var.globals
  vpc_1_id = module.vpc.m_vpc_1_id

  depends_on = [module.roles]
}

module "security_group_rule" {
  source            = "../b2_security_group_rule"
  globals           = var.globals
  security_group_id = module.security_group.m_sg_id

  depends_on = [module.security_group]
}

#module "ec2_image" {
#  source  = "../c1_ec2_image"
#  globals = var.globals
#
#  depends_on = [module.security_group_rule]
#}

module "ec2_instance_master" {
  source                  = "../d1_ec2_instance_master"
  globals                 = var.globals
  sg_id                   = module.security_group.m_sg_id
  image_1_id              = var.globals.amid_id
  subnet_1_id             = module.vpc.m_subnet_1_id
  iam_instance_profile_s3 = module.roles.s3_role_name

  depends_on = [module.security_group_rule]
}

module "eip_ec2_associate" {
  source      = "../e1_eip_ec2_associate"
  instance_id = module.ec2_instance_master.instance_id
  eip_id      = module.eip.elastic_ip_id

  depends_on = [module.ec2_instance_worker]
}

module "step_1_create_devopsadmin" {
  source               = "../f1_create_devopsadmin"
  globals              = var.globals
  elastic_ip_name_oupt = module.eip.elastic_ip_name_oupt

  depends_on = [module.eip_ec2_associate]
}

module "step_2_kubernetes_control" {
  source               = "../f2_kubernetes_control"
  globals              = var.globals
  elastic_ip_name_oupt = module.eip.elastic_ip_name_oupt

  depends_on = [module.step_1_create_devopsadmin]
}

module "ec2_instance_worker" {
  source                  = "../d2_ec2_instance_worker"
  globals                 = var.globals
  sg_id                   = module.security_group.m_sg_id
  image_1_id              = var.globals.amid_id
  subnet_1_id             = module.vpc.m_subnet_1_id
  iam_instance_profile_s3 = module.roles.s3_role_name

  depends_on = [module.security_group_rule]
}


module "step_1_kubernetes_worker" {
  source            = "../g1_kubernetes_worker"
  globals           = var.globals
  ip_address_worker = module.ec2_instance_worker.public_ip

  depends_on = [module.step_2_kubernetes_control]
}


module "get_join_command" {
  source               = "../h1_get_join_command"
  globals              = var.globals
  elastic_ip_name_oupt = module.eip.elastic_ip_name_oupt

  depends_on = [module.step_1_kubernetes_worker]
}

module "push_join_command" {
  source            = "../h2_push_join_command"
  globals           = var.globals
  ip_address_worker = module.ec2_instance_worker.public_ip

  depends_on = [module.get_join_command]
}

#module "github_runner" {
#  source               = "../j1_github_runner"
#  globals              = var.globals
#  elastic_ip_name_oupt = module.eip.elastic_ip_name_oupt

#  depends_on = [module.push_join_command]
#}


