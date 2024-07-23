module "account_vars" {
  source = "../account-vars"
}

module "sqs-use2" {
  source = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/sqs?ref=v11.0.0"

  for_each = local.sqs_parameters

  encryption_type         = each.value.encryption_type
  name                    = each.key
  queue_policy_statements = each.value.queue_policy_statements

  providers = {
    aws = aws.use2
  }
  
  tags = merge(module.account_vars.default_tags, lookup(each.value, "tags", {}), { Name = each.key })
}
