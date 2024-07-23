module "account_vars" {
  source = "../account-vars"
}

module "s3_bucket_use2" {
  source            = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/s3?ref=master"
  for_each          = local.s3_buckets
  acl               = each.value.acl
  kms_cmk_alias     = lookup(each.value, "kms_cmk_alias", null)
  sse_enabled       = lookup(each.value, "sse_enabled", false)
  tags              = merge(module.account_vars.default_tags, lookup(each.value, "tags", {}), { Name = each.key })
  versioning_status = lookup(each.value, "versioning_status", "Disabled")
  providers = {
    aws = aws.use2
  }
}
