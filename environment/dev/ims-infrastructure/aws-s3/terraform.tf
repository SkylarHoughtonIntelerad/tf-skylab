terraform {
  required_version = "1.0.9"
  backend "s3" {
    bucket         = "sre-inf-prod-tfstate"
    region         = "us-east-2"
    role_arn       = "arn:aws:iam::601722232065:role/cross_account_admin"
    key            = "pt-terraform/dev/ims-infrastructure/aws-s3/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "TFState"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.64.0"
    }
  }
}
