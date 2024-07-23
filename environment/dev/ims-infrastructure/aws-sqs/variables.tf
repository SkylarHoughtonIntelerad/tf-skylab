locals {
  sqs_parameters = {
    "sentinel-logs-queue-dev" = {
      encryption_type = "kms"
      queue_policy_statements = {
        account = {
          sid = "AccountReadWrite"
          actions = [
            "sqs:SendMessage",
            "sqs:ReceiveMessage",
          ]
          principals = [
            {
              type        = "AWS"
              identifiers = ["011508672859"]
            }
          ]
        }
      }
    }
  }
}
