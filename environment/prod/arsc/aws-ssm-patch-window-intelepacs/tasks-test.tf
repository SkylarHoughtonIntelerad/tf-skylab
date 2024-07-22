# module "testgroup-check-pacs" {
#   source                      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task?ref=master"
#   shell_task_name             = "${local.testgroup_name}-check-pacs"
#   shell_task                  = "check-pacs.sh"
#   shell_task_priority         = "0"
#   shell_task_window_id        = local.testgroup_window_id
#   shell_task_window_target_id = module.testgroup-target.maintenance-window-target
#   service_role_arn            = var.patch_parameters.service_role_arn
#   max_concurrency             = var.patch_parameters.max_concurrency
#   max_errors                  = var.patch_parameters.max_errors
#   timeout_seconds             = var.timeout_seconds
#   depends_on                  = [module.testgroup-window]
# }

# module "testgroup-patch" {
#   source                      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task?ref=master"
#   shell_task_name             = "${local.testgroup_name}-patch-reboot"
#   shell_task                  = "patch-stop-pacs.sh"
#   shell_task_priority         = "1"
#   shell_task_window_id        = local.testgroup_window_id
#   shell_task_window_target_id = module.testgroup-target.maintenance-window-target
#   service_role_arn            = var.patch_parameters.service_role_arn
#   max_concurrency             = var.patch_parameters.max_concurrency
#   max_errors                  = var.patch_parameters.max_errors
#   timeout_seconds             = var.timeout_seconds
#   depends_on                  = [module.testgroup-window]
# }

# module "testgroup-start-pacs" {
#   source                      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task?ref=master"
#   shell_task_name             = "${local.testgroup_name}-start-pacs"
#   shell_task                  = "start-pacs.sh"
#   shell_task_priority         = "2"
#   shell_task_window_id        = local.testgroup_window_id
#   shell_task_window_target_id = module.testgroup-target.maintenance-window-target
#   service_role_arn            = var.patch_parameters.service_role_arn
#   max_concurrency             = var.patch_parameters.max_concurrency
#   max_errors                  = var.patch_parameters.max_errors
#   timeout_seconds             = var.timeout_seconds
#   depends_on                  = [module.testgroup-window]
# }

# module "testgroup-patch-scan" {
#   source                 = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task?ref=master"
#   patch_task_name        = "${local.testgroup_name}-patch-scan"
#   patch_task_priority    = "3"
#   patch_tasks            = var.patch_tasks
#   patch_window_id        = local.testgroup_window_id
#   patch_window_target_id = module.testgroup-target.maintenance-window-target
#   service_role_arn       = var.patch_parameters.service_role_arn
#   max_concurrency        = var.patch_parameters.max_concurrency
#   max_errors             = var.patch_parameters.max_errors
#   depends_on             = [module.testgroup-window]
# }
