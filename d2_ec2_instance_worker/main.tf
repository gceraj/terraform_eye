resource "aws_instance" "bull_instance_kube_worker" {
  ami                  = var.image_1_id
  instance_type        = var.globals.ec2_inst_type_master
  key_name             = var.globals.ec2_key_name
  subnet_id            = var.subnet_1_id
  iam_instance_profile = var.iam_instance_profile_s3
  vpc_security_group_ids = [
    var.sg_id
  ]
  tags = {
    Name = "${var.globals.ec2_worker_inst_name}-${var.globals.environment}"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu" # Default for most Ubuntu AMIs
    private_key = file(var.globals.file_private_key)
    host        = self.public_ip
  }

}
