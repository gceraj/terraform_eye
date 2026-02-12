resource "null_resource" "remote_exec_runner" {
  triggers = {
    script_hash = filemd5(var.globals.file_script_control_1)
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.globals.file_private_key)
    host        = var.ip_address_worker
  }

  provisioner "remote-exec" {
    inline = [
      "aws s3 cp s3://${var.globals.join_cmd_s3_name}/join.sh /tmp/join.sh  ",
      ". /tmp/join.sh"
    ]
  }
}
