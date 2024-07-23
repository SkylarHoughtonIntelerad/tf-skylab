module "account_vars" {
  source = "../account-vars"
}

module "route53_delegation_set" {
  source = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/route53?ref=master"

  for_each = local.delegation_sets
  tags     = merge(module.account_vars.default_tags, lookup(each.value, "tags", {}), { Name = each.key })
}

module "route53_zone" {
  source = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/route53?ref=master"

  for_each = local.zones
  delegation_set_id = lookup(each.value, "delegation_set_id", null)
  records = lookup(each.value, "records", {})
  vpc_ids = lookup(each.value, "vpc_ids", [])
  tags     = merge(module.account_vars.default_tags, lookup(each.value, "tags", {}), { Name = each.value.name })
}

output "route53_delegation_set" {
  value = module.route53_delegation_set
}

output "route53_zone" {
  value = module.route53_zone
}