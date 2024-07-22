###
# test
#
module "testgroup-patch-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=v4.11.0"
  window_name    = "${local.testgroup_name}-patch"
  window_enabled = true
  schedule       = "cron(0 0 ? * MON#2 *)" #in EST
}

module "testgroup-reboot-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=v4.11.0"
  window_name    = "${local.testgroup_name}-reboot"
  window_enabled = true
  schedule       = "cron(0 1 ? * MON#2 *)"
}

###
# mdb1
#
module "mdb1-patch-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=v4.11.0"
  window_name    = "${local.mdb1_name}-patch"
  window_enabled = true
  schedule       = "cron(0 0 ? * MON#4 *)" #in EST
}

module "mdb1-reboot-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=v4.11.0"
  window_name    = "${local.mdb1_name}-reboot"
  window_enabled = true
  schedule       = "cron(0 1 ? * MON#4 *)"
}

###
# mdb2
#
module "mdb2-patch-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=v4.11.0"
  window_name    = "${local.mdb2_name}-patch"
  window_enabled = true
  schedule       = "cron(0 0 ? * MON#4 *)" #in EST
}

module "mdb2-reboot-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=v4.11.0"
  window_name    = "${local.mdb2_name}-reboot"
  window_enabled = true
  schedule       = "cron(0 2 ? * MON#4 *)"
}

###
# group1
# #
module "group1-patch-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=v4.11.0"
  window_name    = "${local.group1_name}-patch"
  window_enabled = true
  schedule       = "cron(15 0 ? * MON#4 *)"
}

module "group1-reboot-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=v4.11.0"
  window_name    = "${local.group1_name}-reboot"
  window_enabled = true
  schedule       = "cron(15 1 ? * MON#4 *)"
}

###
# group2
#
module "group2-patch-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=v4.11.0"
  window_name    = "${local.group2_name}-patch"
  window_enabled = true
  schedule       = "cron(15 0 ? * MON#4 *)"
}

module "group2-reboot-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=v4.11.0"
  window_name    = "${local.group2_name}-reboot"
  window_enabled = true
  schedule       = "cron(15 2 ? * MON#4 *)"
}
