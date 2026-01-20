terraform {
  backend "s3" {
    bucket         = "gceraj-terraform-state" # your bucket
    key            = "prod/terraform.tfstate" # path inside bucket
    region         = "us-east-1"              # or your region
    use_lockfile   = true                     # lock table name
    dynamodb_table = "gceraj-terraform-locks"
    encrypt        = true
  }
}
