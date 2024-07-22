output "policydoc_slackbot" { value = data.aws_iam_policy_document.policydoc_slackbot.json }
output "policydoc_ai_ecr_pull" { value = data.aws_iam_policy_document.policydoc_ai_ecr_pull.json }
output "policydoc_ssm_instance_profile" { value = data.aws_iam_policy_document.policydoc_ssm_instance_profile.json }
output "policydoc_ssm_operator" { value = data.aws_iam_policy_document.policydoc_ssm_operator.json }
output "policydoc_ssm_readonly" { value = data.aws_iam_policy_document.policydoc_ssm_readonly.json }