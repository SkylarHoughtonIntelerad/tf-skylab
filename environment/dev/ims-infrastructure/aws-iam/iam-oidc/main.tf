module "iam-oidc" {
source    = "/Users/acarter/projects/repositories/pt-modules/pt-modules/aws/iam-oidc"
for_each  = local.items

tags                     = try(each.value.tags, local.defaults.tags, {})
name                     = try(each.value.name, local.defaults.name, null)
path                     = try(each.value.path, local.defaults.path, "/")
description              = try(each.value.description, local.defaults.description, null)
policies                 = try(each.value.policies, local.defaults.policies, null)
force_detach_policies    = try(each.value.force_detach_policies, local.defaults.force_detach_policies, true)
max_session_duration     = try(each.value.max_session_duration, local.defaults.max_session_duration, 3600)
audience                 = try(each.value.audience, local.defaults.audience, "sts.amazonaws.com")
subjects                 = try(each.value.subjects, local.defaults.subjects, [])
provider_url             = try(each.value.provider_url, local.defaults.provider_url, "token.actions.githubusercontent.com")
}