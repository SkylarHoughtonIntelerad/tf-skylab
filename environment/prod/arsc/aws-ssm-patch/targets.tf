module "testgroup-patch-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
  name        = local.testgroup_patch_name
  description = local.testgroup_patch_name
  window_id   = module.testgroup-patch-window.maintenance-window-id
  depends_on  = [module.testgroup-patch-window]
}
module "testgroup-reboot-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
  name        = local.testgroup_reboot_name
  description = local.testgroup_reboot_name
  window_id   = module.testgroup-reboot-window.maintenance-window-id
  depends_on  = [module.testgroup-reboot-window]
}

module "group1-evac-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
  name        = local.group2_patch_name
  description = local.group2_patch_name
  window_id   = module.group1-reboot-window.maintenance-window-id #Schedule group2 resources in group1 window for failover
  depends_on  = [module.group1-reboot-window]
}

module "group2-evac-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
  name        = local.group1_patch_name
  description = local.group1_patch_name
  window_id   = module.group2-reboot-window.maintenance-window-id #Schedule group1 resources in group2 window for failover
  depends_on  = [module.group2-reboot-window]
}

module "group1-patch-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
  name        = local.group1_patch_name
  description = local.group1_patch_name
  window_id   = module.group1-patch-window.maintenance-window-id
  depends_on  = [module.group1-patch-window]
}

module "group2-patch-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
  name        = local.group2_patch_name
  description = local.group2_patch_name
  window_id   = module.group2-patch-window.maintenance-window-id
  depends_on  = [module.group2-patch-window]
}

module "group1-reboot-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
  name        = local.group1_reboot_name
  description = local.group1_reboot_name
  window_id   = module.group1-reboot-window.maintenance-window-id
  depends_on  = [module.group1-reboot-window]
}

module "group2-reboot-target" {
  source      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target?ref=master"
  name        = local.group2_reboot_name
  description = local.group2_reboot_name
  window_id   = module.group2-reboot-window.maintenance-window-id
  depends_on  = [module.group2-reboot-window]
}