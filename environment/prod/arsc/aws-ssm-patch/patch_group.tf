module "testgroup-patchgroup" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group?ref=master"
  patch_group = local.testgroup_patch_name
  baseline_id = var.baseline_id
  depends_on  = [module.testgroup-patch-window]
}

module "testgroup-resourcegroup" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group-patch-groups?ref=master"
  name        = local.testgroup_patch_name
  description = var.description
  tags        = var.testgroup_tags
}

module "group1-resourcegroup" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group-patch-groups?ref=master"
  name        = local.group1_patch_name
  description = var.description
  tags        = var.group1_tags
}

module "group1-patchgroup" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group?ref=master"
  patch_group = local.group1_patch_name
  #baseline_id = module.windows-pb.windows-pb-arn #Module call for custom baselines
  baseline_id = var.baseline_id
  depends_on  = [module.group1-patch-window]
}

module "group2-resourcegroup" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group-patch-groups?ref=master"
  name        = local.group2_patch_name
  description = var.description
  tags        = var.group2_tags
}

module "group2-patchgroup" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group?ref=master"
  patch_group = local.group2_patch_name
  baseline_id = var.baseline_id
  depends_on  = [module.group2-patch-window]
}