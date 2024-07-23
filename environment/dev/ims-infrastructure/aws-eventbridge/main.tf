module "account_vars" {
  source = "../account-vars"
}

data "aws_lambda_function" "lambda_use2" {
  for_each = local.use2

  function_name = each.key
}

module "eventbridge-use2" {
  source              = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/eventbridge?ref=v14.4.0"
  for_each            = local.use2
  lambda_arn          = data.aws_lambda_function.lambda_use2[each.key].arn
  rule_name           = each.key
  event_pattern       = try(each.value.event_pattern, null)
  schedule_expression = try(each.value.schedule_expression, null)
  providers = {
    aws = aws.use2
  }

  tags = merge(module.account_vars.default_tags, lookup(each.value, "tags", {}), { Name = each.key })
}
