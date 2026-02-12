output "s3_role_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}