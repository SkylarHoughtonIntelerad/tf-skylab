###
# test
#
module "testgroup-patch-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.testgroup_name
  description = local.testgroup_name
  window_id   = module.testgroup-patch-window.maintenance-window-id
  depends_on  = [module.testgroup-patch-window]
}

module "testgroup-evac-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.testgroup_name
  description = local.testgroup_name
  window_id   = module.testgroup-reboot-window.maintenance-window-id #Schedule group2 resources in group1 window for failover
  depends_on  = [module.testgroup-reboot-window]
}

module "testgroup-reboot-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.testgroup_name
  description = local.testgroup_name
  window_id   = module.testgroup-reboot-window.maintenance-window-id
  depends_on  = [module.testgroup-reboot-window]
}

###
# mdb1
#
module "mdb1-patch-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.mdb1_name
  description = local.mdb1_name
  window_id   = module.mdb1-patch-window.maintenance-window-id
  depends_on  = [module.mdb1-patch-window]
}

module "mdb1-evac-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.mdb2_name
  description = local.mdb2_name
  window_id   = module.mdb1-reboot-window.maintenance-window-id #Schedule group2 resources in group1 window for failover
  depends_on  = [module.mdb1-reboot-window]
}

module "mdb1-reboot-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.mdb1_name
  description = local.mdb1_name
  window_id   = module.mdb1-reboot-window.maintenance-window-id
  depends_on  = [module.mdb1-reboot-window]
}

###
# mdb2
#
module "mdb2-patch-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.mdb2_name
  description = local.mdb2_name
  window_id   = module.mdb2-patch-window.maintenance-window-id
  depends_on  = [module.mdb2-patch-window]
}

module "mdb2-evac-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.mdb1_name
  description = local.mdb1_name
  window_id   = module.mdb2-reboot-window.maintenance-window-id #Schedule group2 resources in group1 window for failover
  depends_on  = [module.mdb2-reboot-window]
}

module "mdb2-reboot-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.mdb2_name
  description = local.mdb2_name
  window_id   = module.mdb2-reboot-window.maintenance-window-id
  depends_on  = [module.mdb2-reboot-window]
}

###
# group1
#
module "group1-patch-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.group1_name
  description = local.group1_name
  window_id   = module.group1-patch-window.maintenance-window-id
  depends_on  = [module.group1-patch-window]
}

module "group1-evac-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.group2_name
  description = local.group2_name
  window_id   = module.group1-reboot-window.maintenance-window-id #Schedule group2 resources in group1 window for failover
  depends_on  = [module.group1-reboot-window]
}

module "group1-reboot-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.group1_name
  description = local.group1_name
  window_id   = module.group1-reboot-window.maintenance-window-id
  depends_on  = [module.group1-reboot-window]
}

###
# group2
#
module "group2-patch-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.group2_name
  description = local.group2_name
  window_id   = module.group2-patch-window.maintenance-window-id
  depends_on  = [module.group2-patch-window]
}

module "group2-evac-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.group1_name
  description = local.group1_name
  window_id   = module.group2-reboot-window.maintenance-window-id #Schedule group2 resources in group1 window for failover
  depends_on  = [module.group2-reboot-window]
}

module "group2-reboot-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=v4.13.2"
  name        = local.group2_name
  description = local.group2_name
  window_id   = module.group2-reboot-window.maintenance-window-id
  depends_on  = [module.group2-reboot-window]
}
