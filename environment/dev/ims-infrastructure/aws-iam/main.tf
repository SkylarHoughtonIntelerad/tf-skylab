module "account_vars" {
  source = "../account-vars"
}

module "local_policies" {
  source = "./policies"
}

module "common_policies" {
  source = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/common/policies?ref=master"
}

module "custom_policies" {
  source = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/iam-policy-doc?ref=master"

  for_each   = local.policies
  statements = each.value.statements
}

module "iam_user" {
  source = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/iam-user?ref=master"

  for_each = local.users

  name            = each.key
  first_name      = each.value.first_name
  last_name       = each.value.last_name
  email           = each.value.email
  groups          = try(each.value.groups, [])
  aws_policies    = try(each.value.aws_policies, [])
  inline_policy   = try(each.value.inline_policy, null)
  path            = lookup(each.value, "path", null)
  service_account = lookup(each.value, "service_account", false)
  tags            = merge(module.account_vars.default_tags, lookup(each.value, "tags", {}))
  user_type       = each.value.user_type
}

module "iam_role" {
  source = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/iam-role?ref=master"

  for_each           = local.roles
  assume_role_policy = each.value.assume_role_policy # data.aws_iam_policy_document.main[each.value.assume_role_policy].json
  policy             = each.value.policy
  tags               = merge(module.account_vars.default_tags, lookup(each.value, "tags", {}), { Name = each.key })
}
# module "iam-oidc" {
#   source   = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/iam-oidc?ref=master"
#   for_each = local.items

#   tags                  = try(each.value.tags, local.defaults.tags, {})
#   name                  = try(each.value.name, local.defaults.name, null)
#   path                  = try(each.value.path, local.defaults.path, "/")
#   description           = try(each.value.description, local.defaults.description, null)
#   policies              = try(each.value.policies, local.defaults.policies, null)
#   force_detach_policies = try(each.value.force_detach_policies, local.defaults.force_detach_policies, true)
#   max_session_duration  = try(each.value.max_session_duration, local.defaults.max_session_duration, 3600)
#   audience              = try(each.value.audience, local.defaults.audience, "sts.amazonaws.com")
#   subjects              = try(each.value.subjects, local.defaults.subjects, [])
#   provider_url          = try(each.value.provider_url, local.defaults.provider_url, "token.actions.githubusercontent.com")
# }
