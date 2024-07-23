terraform {
  backend "s3" {
    bucket         = "sre-inf-prod-tfstate"
    region         = "us-east-2"
    role_arn       = "arn:aws:iam::601722232065:role/sre-inf_cross_account"
    key            = "pt-terraform/dev/ims-infrastructure/aws-eventbridge/sre-platform-mw-alerts/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "TFState"
  }
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.21.0"
    }
  }
}
