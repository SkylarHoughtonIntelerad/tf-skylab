locals {
  common_defaults = {
    account_id                 = "959946720450"
    traffic_type               = "ALL"
    log_destination_type       = "cloud-watch-logs"
    max_aggregation_interval   = 60
    retention_in_days          = 90
    enable-eni-logs            = false
    enable-vpc-logs            = true
    enable-subnet-logs         = false
    enable-tgw-attachment-logs = true
    iam_role_arn               = "arn:aws:iam::959946720450:role/assume_vpc_logging"
  }

  flowlogs = {
    "vpc-0f393ffae034a0d32" = {
      vpc_id = "vpc-0f393ffae034a0d32"
      region = "us-east-2"
    },
    "vpc-0782e4fc0dfece26b" = {
      vpc_id = "vpc-0782e4fc0dfece26b"
      region = "us-east-2"
    },
  }

  merged_flowlogs = { for k, v in local.flowlogs : k => merge(local.common_defaults, v) }
  
}
