# ###
# # Test Group Section
# #
# module "testgroup-patch" {
#   source                          = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-noreboot?ref=master"
#   patch_noreboot_name             = "${local.testgroup_patch_name}-Patch"
#   patch_noreboot_priority         = "0"
#   patch_noreboot_window_id        = local.testgroup_patch_window_id
#   patch_noreboot_window_target_id = module.testgroup-patch-target.maintenance-window-target
#   depends_on                      = [module.testgroup-patch-window]
# }

# module "testgroup-reboot" {
#   source                        = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-reboot?ref=master"
#   patch_reboot_name             = "${local.testgroup_reboot_name}-Reboot"
#   patch_reboot_priority         = "3"
#   patch_reboot_window_id        = local.testgroup_reboot_window_id
#   patch_reboot_window_target_id = module.testgroup-reboot-target.maintenance-window-target
#   depends_on                    = [module.testgroup-reboot-window]
# }

# ###
# # Group1 Section
# #
# module "group1-patch" {
#   source                          = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-noreboot?ref=master"
#   patch_noreboot_name             = "${local.group1_patch_name}-Patch"
#   patch_noreboot_priority         = "0"
#   patch_noreboot_window_id        = local.group1_patch_window_id
#   patch_noreboot_window_target_id = module.group1-patch-target.maintenance-window-target
#   depends_on                      = [module.group1-patch-window]
# }

# module "group1-win-stop-services" {
#   source                             = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-stop-services?ref=master"
#   win_stop_services_name             = "${local.group1_reboot_name}-Win-Stop-Services"
#   win_stop_services_priority         = "0"
#   win_stop_services_window_id        = local.group1_reboot_window_id
#   win_stop_services_window_target_id = module.group1-reboot-target.maintenance-window-target #Run group2 resources in group1 window
#   depends_on                         = [module.group1-reboot-window]
# }

# module "group1-win-evac" {
#   source                    = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-evac?ref=master"
#   win_evac_name             = "${local.group1_reboot_name}-Win-Evac"
#   win_evac_priority         = "1"
#   win_evac_window_id        = local.group1_reboot_window_id
#   win_evac_window_target_id = module.group1-evac-target.maintenance-window-target #Run group2 resources in group1 window
#   depends_on                = [module.group1-reboot-window]
# }

# module "group1-win-start-services" {
#   source                              = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-start-services?ref=master"
#   win_start_services_name             = "${local.group1_reboot_name}-Win-Start-Services"
#   win_start_services_priority         = "2"
#   win_start_services_window_id        = local.group1_reboot_window_id
#   win_start_services_window_target_id = module.group1-evac-target.maintenance-window-target #Run group2 resources in group1 window
#   depends_on                          = [module.group1-reboot-window]
# }

# module "group1-reboot" {
#   source                        = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-reboot?ref=master"
#   patch_reboot_name             = "${local.group1_reboot_name}-Reboot"
#   patch_reboot_priority         = "3"
#   patch_reboot_window_id        = local.group1_reboot_window_id
#   patch_reboot_window_target_id = module.group1-reboot-target.maintenance-window-target
#   depends_on                    = [module.group1-reboot-window]
# }

# ###
# # Group2 Section
# #
# module "group2-patch" {
#   source                          = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-noreboot?ref=master"
#   patch_noreboot_name             = "${local.group2_patch_name}-Patch"
#   patch_noreboot_priority         = "0"
#   patch_noreboot_window_id        = local.group2_patch_window_id
#   patch_noreboot_window_target_id = module.group2-patch-target.maintenance-window-target
#   depends_on                      = [module.group2-patch-window]
# }

# module "group2-win-stop-services" {
#   source                             = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-stop-services?ref=master"
#   win_stop_services_name             = "${local.group2_reboot_name}-Win-Stop-Services"
#   win_stop_services_priority         = "0"
#   win_stop_services_window_id        = local.group2_reboot_window_id
#   win_stop_services_window_target_id = module.group2-reboot-target.maintenance-window-target #Run group1 resources in group2 window
#   depends_on                         = [module.group2-reboot-window]
# }

# module "group2-win-evac" {
#   source                    = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-evac?ref=master"
#   win_evac_name             = "${local.group2_reboot_name}-Evac"
#   win_evac_priority         = "1"
#   win_evac_window_id        = local.group2_reboot_window_id
#   win_evac_window_target_id = module.group2-evac-target.maintenance-window-target
#   depends_on                = [module.group2-reboot-window]
# }

# module "group2-win-start-services" {
#   source                              = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-start-services?ref=master"
#   win_start_services_name             = "${local.group2_reboot_name}-Win-Start-Services"
#   win_start_services_priority         = "2"
#   win_start_services_window_id        = local.group2_reboot_window_id
#   win_start_services_window_target_id = module.group2-evac-target.maintenance-window-target #Run group1 resources in group2 window
#   depends_on                          = [module.group2-reboot-window]
# }

# module "group2-reboot" {
#   source                        = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-reboot?ref=master"
#   patch_reboot_name             = "${local.group2_reboot_name}-Reboot"
#   patch_reboot_priority         = "3"
#   patch_reboot_window_id        = local.group2_reboot_window_id
#   patch_reboot_window_target_id = module.group2-reboot-target.maintenance-window-target
#   depends_on                    = [module.group2-reboot-window]
# }
