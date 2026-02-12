#resource "aws_eip" "eip_bull" {
#
#  tags = {
#    Name = "${var.globals.elastic_ip_name}-${var.globals.environment}-${var.globals.project}"
#  }
#}

data "aws_eip" "by_allocation_id" {
  id = "eipalloc-0861844120827e306"
}


