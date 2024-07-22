module "mdb2-patch" {
  source                 = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task?ref=v4.13.2"
  patch_task_name        = "${local.mdb2_name}-patch-task"
  patch_task_priority    = "0"
  patch_tasks            = var.patch_tasks
  patch_window_id        = local.mdb2_patch_window_id
  patch_window_target_id = module.mdb2-patch-target.maintenance-window-target
  service_role_arn       = var.patch_parameters.service_role_arn
  max_concurrency        = var.patch_parameters.max_concurrency
  max_errors             = var.patch_parameters.max_errors
  depends_on             = [module.mdb2-patch-window]
}

module "mdb2-stop-windows" {
  source                           = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task?ref=v4.13.2"
  powershell_task_name             = "${local.mdb2_name}-stop-windows-task"
  powershell_task                  = "stop-clario.ps1"
  powershell_task_priority         = "0"
  powershell_task_window_id        = local.mdb2_reboot_window_id
  powershell_task_window_target_id = module.mdb2-reboot-target.maintenance-window-target
  service_role_arn                 = var.patch_parameters.service_role_arn
  max_concurrency                  = var.patch_parameters.max_concurrency
  max_errors                       = var.patch_parameters.max_errors
  timeout_seconds                  = var.timeout_seconds
  depends_on                       = [module.mdb2-reboot-window]
}

module "mdb2-evac-windows" {
  source                           = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task?ref=v4.13.2"
  powershell_task_name             = "${local.mdb2_name}-evac-windows-task"
  powershell_task                  = "evac-clario.ps1"
  powershell_task_priority         = "1"
  powershell_task_window_id        = local.mdb2_reboot_window_id
  powershell_task_window_target_id = module.mdb2-evac-target.maintenance-window-target
  service_role_arn                 = var.patch_parameters.service_role_arn
  max_concurrency                  = var.patch_parameters.max_concurrency
  max_errors                       = var.patch_parameters.max_errors
  timeout_seconds                  = var.timeout_seconds
  depends_on                       = [module.mdb2-reboot-window]
}

module "mdb2-start-windows" {
  source                           = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task?ref=v4.13.2"
  powershell_task_name             = "${local.mdb2_name}-start-windows-task"
  powershell_task                  = "start-clario.ps1"
  powershell_task_priority         = "2"
  powershell_task_window_id        = local.mdb2_reboot_window_id
  powershell_task_window_target_id = module.mdb2-evac-target.maintenance-window-target
  service_role_arn                 = var.patch_parameters.service_role_arn
  max_concurrency                  = var.patch_parameters.max_concurrency
  max_errors                       = var.patch_parameters.max_errors
  timeout_seconds                  = var.timeout_seconds
  depends_on                       = [module.mdb2-reboot-window]
}

module "mdb2-reboot" {
  source                 = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task?ref=v4.13.2"
  patch_task_name        = "${local.mdb2_name}-reboot-task"
  patch_task_priority    = "3"
  patch_tasks            = var.reboot_tasks
  patch_window_id        = local.mdb2_reboot_window_id
  patch_window_target_id = module.mdb2-reboot-target.maintenance-window-target
  service_role_arn       = var.patch_parameters.service_role_arn
  max_concurrency        = var.patch_parameters.max_concurrency
  max_errors             = var.patch_parameters.max_errors
  depends_on             = [module.mdb2-reboot-window]
}
