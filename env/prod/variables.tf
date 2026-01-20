variable "globals" {
  type = object({
    environment          = string
    project              = string
    vpc_1_cidr_block     = string
    vpc_1_name           = string
    vpc_1_subnet_1_block = string
    vpc_1_subnet_1_name  = string
    sg_1_name            = string
    ec2_key_name         = string
    ec2_inst_type_master = string
    ec2_inst_type_worker = string
    ec2_master_inst_name = string
    tags                 = map(string)
  })
}

