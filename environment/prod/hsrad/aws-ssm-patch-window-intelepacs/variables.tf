variable "timeout_seconds" { default = 600 }

variable "patch_parameters" {
  default = {
    baseline_id      = "pb-0b4048a445028990a" #IntelePACS-CentOSPatchBaseline-Prod
    service_role_arn = "arn:aws:iam::601722232065:role/SSMServiceRole"
    max_concurrency  = "60%"
    max_errors       = "20%"
  }
}

variable "testgroup_tags" {
  type        = map(string)
  description = "Resource Group Tags"
  default = {
    "Customer"    = "hsrad",
    "Patch Group" = "test",
    "Product"     = "intelepacs"
  }
}

variable "group1_tags" {
  type        = map(string)
  description = "Resource Group Tags"
  default = {
    "Customer"    = "hsrad",
    "Patch Group" = "group1",
    "Product"     = "intelepacs"
  }
}

variable "group2_tags" {
  type        = map(string)
  description = "Resource Group Tags"
  default = {
    "Customer"    = "hsrad",
    "Patch Group" = "group2",
    "Product"     = "intelepacs"
  }
}

variable "patch_tasks" {
  type = list(object({
    name   = string
    values = list(string)
  }))
  default = [
    {
      name   = "Operation"
      values = ["Scan"]
    },
    {
      name   = "RebootOption"
      values = ["NoReboot"]
    },
    {
      name   = "PreInstallHookDocName"
      values = ["AWS-Noop"]
    },
    {
      name   = "PostInstallHookDocName"
      values = ["AWS-Noop"]
    },
  ]
}

variable "reboot_tasks" {
  type = list(object({
    name   = string
    values = list(string)
  }))
  default = [
    {
      name   = "Operation"
      values = ["Install"]
    },
    {
      name   = "RebootOption"
      values = ["RebootIfNeeded"]
    },
    {
      name   = "PreInstallHookDocName"
      values = ["AWS-Noop"]
    },
    {
      name   = "PostInstallHookDocName"
      values = ["AWS-Noop"]
    },
  ]
}
