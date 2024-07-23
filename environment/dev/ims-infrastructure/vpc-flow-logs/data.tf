data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
# VPC Flow Logs module
data "aws_vpcs" "all" {}