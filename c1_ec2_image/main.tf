data "aws_ssm_parameter" "ubuntu_2404" {
  name = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical, still recommended for safety

  filter {
    name   = "image-id"
    values = [data.aws_ssm_parameter.ubuntu_2404.value]
  }
}

