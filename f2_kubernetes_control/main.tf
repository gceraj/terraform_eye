resource "null_resource" "remote_exec_runner" {
  triggers = {
    script_hash = filemd5(var.globals.file_script_control_2)
  }
  connection {
    type        = "ssh"
    user        = "ubuntu" # Default for most Ubuntu AMIs
    private_key = file(var.globals.file_private_key)
    host        = var.elastic_ip_name_oupt
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Executing remote commands...'",
      file(var.globals.file_script_control_2)
    ]
  }
}
