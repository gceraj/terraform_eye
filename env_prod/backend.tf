
terraform {
  backend "s3" {
    bucket       = "falcon-terraform-state-gceraj" # your bucket
    key          = "prod/terraform.tfstate"        # path inside bucket
    region       = "us-east-1"                     # or your region
    use_lockfile = true                            # lock table name
    encrypt      = true
  }
}
