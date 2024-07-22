###
# test
#
module "testgroup-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=master"
  window_name    = local.testgroup_name
  window_enabled = true
  schedule       = "cron(0 1 ? 1,4,7,10 MON#2 *)" #in EST
}

##
# group1
#
module "group1-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=master"
  window_name    = local.group1_name
  window_enabled = true
  schedule       = "cron(0 1 ? 1,4,7,10 MON#4 *)"
}

###
# group2
#
module "group2-window" {
  source         = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window?ref=master"
  window_name    = local.group2_name
  window_enabled = true
  schedule       = "cron(0 2 ? 1,4,7,10 MON#4 *)"
}
