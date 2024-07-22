# ###
# # test
# #
# module "testgroup-patchgroup" {
#   source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group?ref=master"
#   patch_group = local.testgroup_name
#   baseline_id = var.patch_parameters.baseline_id
#   depends_on  = [module.testgroup-window]
# }

# module "testgroup-resourcegroup" {
#   source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group?ref=master"
#   name           = local.testgroup_name
#   description    = local.testgroup_name
#   tags           = var.testgroup_tags
#   resource_query = local.testgroup_query
# }

# ###
# # mdb1
# #
# module "mdb1-patchgroup" {
#   source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group?ref=master"
#   patch_group = local.mdb1_name
#   baseline_id = var.patch_parameters.baseline_id
#   depends_on  = [module.mdb1-window]
# }

# module "mdb1-resourcegroup" {
#   source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group?ref=master"
#   name           = local.mdb1_name
#   description    = local.mdb1_name
#   tags           = var.mdb1_tags
#   resource_query = local.mdb1_query
# }

# ###
# # mdb2
# #
# module "mdb2-patchgroup" {
#   source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group?ref=master"
#   patch_group = local.mdb2_name
#   baseline_id = var.patch_parameters.baseline_id
#   depends_on  = [module.mdb2-window]
# }

# module "mdb2-resourcegroup" {
#   source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group?ref=master"
#   name           = local.mdb2_name
#   description    = local.mdb2_name
#   tags           = var.mdb2_tags
#   resource_query = local.mdb2_query
# }

# ###
# # group1
# #
# module "group1-patchgroup" {
#   source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group?ref=master"
#   patch_group = local.group1_name
#   baseline_id = var.patch_parameters.baseline_id
#   depends_on  = [module.group1-window]
# }

# module "group1-resourcegroup" {
#   source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group?ref=master"
#   name           = local.group1_name
#   description    = local.group1_name
#   tags           = var.group1_tags
#   resource_query = local.group1_query
# }

# ###
# # group2
# #
# module "group2-patchgroup" {
#   source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group?ref=master"
#   patch_group = local.group2_name
#   baseline_id = var.patch_parameters.baseline_id
#   depends_on  = [module.group2-window]
# }

# module "group2-resourcegroup" {
#   source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group?ref=master"
#   name           = local.group2_name
#   description    = local.group2_name
#   tags           = var.group2_tags
#   resource_query = local.group2_query
# }
