module "account_vars" {
  source = "../account-vars"
}

module "lambda-use2" {
  source                = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/lambda?ref=v16.2.0"
  for_each              = local.use2
  architectures         = each.value.architectures
  archive_file          = each.value.archive_file
  environment_variables = each.value.environment_variables
  function_code         = each.value.function_code
  function_name         = each.key
  handler               = try(each.value.handler, null)
  layer_name            = try(each.value.layer_name, null)
  layer_runtime         = try(each.value.layer_runtime, null)
  log_retention_in_days = each.value.log_retention_in_days
  role                  = each.value.role
  runtime               = each.value.runtime
  timeout               = each.value.timeout

  providers = {
    aws = aws.use2
  }

  tags = merge(module.account_vars.default_tags, lookup(each.value, "tags", {}), { Name = each.key })
}
