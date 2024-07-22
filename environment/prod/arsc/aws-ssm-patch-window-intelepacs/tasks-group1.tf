# module "group1-check-pacs" {
#   source                      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task?ref=master"
#   shell_task_name             = "${local.group1_name}-check-pacs"
#   shell_task                  = "check-pacs.sh"
#   shell_task_priority         = "0"
#   shell_task_window_id        = local.group1_window_id
#   shell_task_window_target_id = module.group1-target.maintenance-window-target
#   service_role_arn            = var.patch_parameters.service_role_arn
#   max_concurrency             = var.patch_parameters.max_concurrency
#   max_errors                  = var.patch_parameters.max_errors
#   timeout_seconds             = var.timeout_seconds
#   depends_on                  = [module.group1-window]
# }

# module "group1-patch" {
#   source                      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task?ref=master"
#   shell_task_name             = "${local.group1_name}-patch-reboot"
#   shell_task                  = "patch-stop-pacs.sh"
#   shell_task_priority         = "1"
#   shell_task_window_id        = local.group1_window_id
#   shell_task_window_target_id = module.group1-target.maintenance-window-target
#   service_role_arn            = var.patch_parameters.service_role_arn
#   max_concurrency             = var.patch_parameters.max_concurrency
#   max_errors                  = var.patch_parameters.max_errors
#   timeout_seconds             = var.timeout_seconds
#   depends_on                  = [module.group1-window]
# }

# module "group1-start-pacs" {
#   source                      = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task?ref=master"
#   shell_task_name             = "${local.group1_name}-start-pacs"
#   shell_task                  = "start-pacs.sh"
#   shell_task_priority         = "2"
#   shell_task_window_id        = local.group1_window_id
#   shell_task_window_target_id = module.group1-target.maintenance-window-target
#   service_role_arn            = var.patch_parameters.service_role_arn
#   max_concurrency             = var.patch_parameters.max_concurrency
#   max_errors                  = var.patch_parameters.max_errors
#   timeout_seconds             = var.timeout_seconds
#   depends_on                  = [module.group1-window]
# }

# module "group1-patch-scan" {
#   source                 = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task?ref=master"
#   patch_task_name        = "${local.group1_name}-patch-scan"
#   patch_task_priority    = "3"
#   patch_tasks            = var.patch_tasks
#   patch_window_id        = local.group1_window_id
#   patch_window_target_id = module.group1-target.maintenance-window-target
#   service_role_arn       = var.patch_parameters.service_role_arn
#   max_concurrency        = var.patch_parameters.max_concurrency
#   max_errors             = var.patch_parameters.max_errors
#   depends_on             = [module.group1-window]
# }