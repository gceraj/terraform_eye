terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 6.28.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Region      = "us-east-1"
      Environment = var.globals.environment
      Project     = var.globals.project
    }
  }
}
