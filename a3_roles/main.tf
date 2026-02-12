# -----------------------------
# IAM Role for EC2
# -----------------------------
resource "aws_iam_role" "ec2_role" {
  name = "ec2-s3-access-role-falcon"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# -----------------------------
# Inline Policy for S3 Access
# -----------------------------
resource "aws_iam_role_policy" "s3_policy" {
  name = "ec2-s3-join-command-policy"
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject"
        ]
        Resource = "arn:aws:s3:::${var.globals.join_cmd_s3_name}/*"
      }
    ]
  })
}

# -----------------------------
# Instance Profile (required for EC2)
# -----------------------------
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-s3-access-profile-falcon"
  role = aws_iam_role.ec2_role.name
}
