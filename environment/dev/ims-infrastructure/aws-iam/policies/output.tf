output "policydoc_cw_logs_to_s3" { value = data.aws_iam_policy_document.policydoc_cw_logs_to_s3.json }
output "policydoc_slackbot" { value = data.aws_iam_policy_document.policydoc_slackbot.json }