#Test Group patches a week before prod
module "testgroup-patch-window" {
  source            = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=master"
  window_name = "${local.testgroup_patch_name}-Patch"
  schedule    = "cron(0 23 ? * THU#4 *)" #in EST
}

module "testgroup-reboot-window" {
  source            = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=master"
  window_name = "${local.testgroup_reboot_name}-EvacReboot"
  schedule    = "cron(0 1 ? * FRI#4 *)"
}

module "group1-patch-window" {
  source            = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=master"
  window_name       = "${local.group1_patch_name}-Patch"
  schedule          = "cron(0 23 ? * THU#4 *)"
}

module "group1-reboot-window" {
  source            = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=master"
  window_name       = "${local.group1_reboot_name}-EvacReboot"
  schedule          = "cron(0 1 ? * FRI#4 *)"
}

module "group2-patch-window" {
  source            = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=master"
  window_name       = "${local.group2_patch_name}-Patch"
  schedule          = "cron(0 23 ? * THU#4 *)"
}

module "group2-reboot-window" {
  source            = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=master"
  window_name       = "${local.group2_reboot_name}-EvacReboot"
  schedule          = "cron(0 2 ? * FRI#4 *)"
}


