
module "cloudwatch" {
  source   = "github.com/dicomgrid/pt-modules.git//aws/vpc-flow-logs/cloudwatch?ref=master"
  for_each = local.merged_flowlogs

  account_id                 = each.value.account_id
  region                     = each.value.region
  vpc_id                     = each.value.vpc_id
  traffic_type               = each.value.traffic_type
  iam_role_arn               = each.value.iam_role_arn
  log_destination_type       = each.value.log_destination_type
  log_destination            = "${each.value.account_id}/${data.aws_region.current.name}/${each.value.vpc_id}"
  max_aggregation_interval   = each.value.max_aggregation_interval
  retention_in_days          = each.value.retention_in_days
  enable-eni-logs            = each.value.enable-eni-logs
  enable-subnet-logs         = each.value.enable-subnet-logs
  enable-vpc-logs            = each.value.enable-vpc-logs
  enable-tgw-attachment-logs = each.value.enable-tgw-attachment-logs
  tags = {
    Environment = "dev"
    Application = "logging"
    CodeManaged = "terraform"
    LogFilter   = each.value.vpc_id
  }
}