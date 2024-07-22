#TODO: map of tag maps
variable "testgroup_tags" {
  type        = map(string)
  description = "Resource Group Tags"
  default = {
    "Customer"    = "hsrad",
    "Patch_Group" = "test",
    "OS"          = "windows"
  }
}

variable "mdb1_tags" {
  type        = map(string)
  description = "Resource Group Tags"
  default = {
    "Customer"    = "hsrad",
    "Patch_Group" = "mdb1",
    "OS"          = "windows",
    "Application" = "mdb"
  }
}

variable "mdb2_tags" {
  type        = map(string)
  description = "Resource Group Tags"
  default = {
    "Customer"    = "hsrad",
    "Patch_Group" = "mdb2",
    "OS"          = "windows",
    "Application" = "mdb"
  }
}

variable "group1_tags" {
  type        = map(string)
  description = "Resource Group Tags"
  default = {
    "Customer"    = "hsrad",
    "Patch_Group" = "group1",
    "OS"          = "windows",
  }
}

variable "group2_tags" {
  type        = map(string)
  description = "Resource Group Tags"
  default = {
    "Customer"    = "hsrad",
    "Patch_Group" = "group2",
    "OS"          = "windows",

  }
}

variable "timeout_seconds" { default = 600 }

variable "patch_parameters" {
  default = {
    baseline_id      = "pb-082994d4d2f5cf385"
    service_role_arn = "arn:aws:iam::601722232065:role/SSMServiceRole"
    max_concurrency  = "60%"
    max_errors       = "20%"
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
      values = ["Install"]
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
