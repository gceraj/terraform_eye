variable "globals" {
  type = object({
    terraform_state_s3    = string
    environment           = string
    region                = string
    project               = string
    elastic_ip_name       = string
    vpc_1_cidr_block      = string
    vpc_1_name            = string
    vpc_1_subnet_1_block  = string
    vpc_1_subnet_1_name   = string
    vpc_1_public_1_block  = string
    vpc_1_public_1_name   = string
    vpc_1_subnet_1_az     = string
    sg_1_name             = string
    ec2_key_name          = string
    ec2_inst_type_master  = string
    ec2_inst_type_worker  = string
    ec2_master_inst_name  = string
    ec2_worker_inst_name  = string
    file_private_key      = string
    file_script_control_1 = string
    file_script_control_2 = string
    file_script_worker_1  = string
    file_script_github    = string
    join_cmd_s3_name      = string
    gitrunnercode         = string
    tags                  = map(string)
  })
}

