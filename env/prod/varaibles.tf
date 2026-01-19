variable "globals" {
  type = object({
    environment          = string
    project              = string
    vpc_1_cidr_block     = string
    vpc_1_name           = string
	vpc_1_subnet_1_block = string
    vpc_1_subnet_1_name  = string
    sg_1_name            = string
    tags                 = map(string)
  })
}

