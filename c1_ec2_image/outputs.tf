output "m_image_id" {
  value       = data.aws_ami.ubuntu.id
  description = "Image ID"
}
