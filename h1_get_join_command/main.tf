resource "null_resource" "remote_exec_runner" {
  triggers = {
    script_hash = filemd5(var.globals.file_script_control_1)
  }
  connection {
    type        = "ssh"
    user        = "ubuntu" # Default for most Ubuntu AMIs
    private_key = file(var.globals.file_private_key)
    host        = var.elastic_ip_name_oupt
  }

  provisioner "remote-exec" {
    inline = [
      "kubeadm token create --print-join-command | sed 's/^/sudo /' > /tmp/join.sh",
      "aws s3 cp /tmp/join.sh  s3://${var.globals.join_cmd_s3_name}/join.sh"
    ]
  }
}
