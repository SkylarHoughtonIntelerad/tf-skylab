# ###
# # test
# #
# module "testgroup-target" {
#   source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
#   name        = local.testgroup_name
#   description = local.testgroup_name
#   window_id   = module.testgroup-window.maintenance-window-id
#   depends_on  = [module.testgroup-window]
# }

# ###
# # mdb1
# #
# module "mdb1-target" {
#   source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
#   name        = local.mdb1_name
#   description = local.mdb1_name
#   window_id   = module.mdb1-window.maintenance-window-id
#   depends_on  = [module.mdb1-window]
# }

# ###
# # mdb2
# #
# module "mdb2-target" {
#   source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
#   name        = local.mdb2_name
#   description = local.mdb2_name
#   window_id   = module.mdb2-window.maintenance-window-id
#   depends_on  = [module.mdb2-window]
# }

# ###
# # group1
# #
# module "group1-target" {
#   source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
#   name        = local.group1_name
#   description = local.group1_name
#   window_id   = module.group1-window.maintenance-window-id
#   depends_on  = [module.group1-window]
# }

# ###
# # group2
# #
# module "group2-target" {
#   source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
#   name        = local.group2_name
#   description = local.group2_name
#   window_id   = module.group2-window.maintenance-window-id
#   depends_on  = [module.group2-window]
# }
