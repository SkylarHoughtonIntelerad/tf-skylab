locals {
  use2 = {
    "plt-test-mw-error-slackbot" = {
      event_pattern = <<EOF
{
  "source": ["aws.ssm"],
  "detail-type": ["Maintenance Window Task Execution State-change Notification"],
  "detail": {
    "status": ["FAILED", "TIMED_OUT", "CANCELLED", "CANCELLING", "SKIPPED_OVERLAPPING"]
  }
}
EOF
    }
    "plt-test-mw-info-slackbot" = {
      event_pattern = <<EOF
{
  "source": ["aws.ssm"],
  "detail-type": ["Maintenance Window Task Execution State-change Notification"],
  "detail": {
    "status": ["IN_PROGRESS", "SUCCESS", "PENDING"]
  }
}
EOF
    }
    "cw_logs_to_s3" = {
      schedule_expression = "cron(0/15 */6 ? * * *)"
    }
  }
}
