resource "aws_instance" "gceraj_instance_kube_master" {
  ami           = var.image_1_id
  instance_type = var.globals.ec2_inst_type_master
  key_name      = var.globals.ec2_key_name
  subnet_id     = var.subnet_1_id
  vpc_security_group_ids = [
    var.sg_id
  ]
  tags = {
    Name = "${var.globals.ec2_master_inst_name}-${var.globals.environment}"
  }
}
