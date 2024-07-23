## Global Vars ##
locals {
  testgroup_patch_name  = "${var.testgroup_tags["Customer"]}-${var.testgroup_tags["Group"]}"
  testgroup_reboot_name = "${var.testgroup_tags["Customer"]}-${var.testgroup_tags["Group"]}"
  group1_patch_name     = "${var.group1_tags["Customer"]}-${var.group1_tags["Group"]}"
  group2_patch_name     = "${var.group2_tags["Customer"]}-${var.group2_tags["Group"]}"
  group1_reboot_name    = "${var.group1_tags["Customer"]}-${var.group1_tags["Group"]}"
  group2_reboot_name    = "${var.group2_tags["Customer"]}-${var.group2_tags["Group"]}"
}

locals {
  testgroup_patch_window_id  = module.testgroup-patch-window.maintenance-window-id
  testgroup_reboot_window_id = module.testgroup-reboot-window.maintenance-window-id
  group1_patch_window_id     = module.group1-patch-window.maintenance-window-id
  group2_patch_window_id     = module.group2-patch-window.maintenance-window-id
  group1_reboot_window_id    = module.group1-reboot-window.maintenance-window-id
  group2_reboot_window_id    = module.group2-reboot-window.maintenance-window-id
}
variable "description" {
  type        = string
  description = "Default Description"
  default     = "ARSC"
}

variable "testgroup_tags" {
  type        = map(string)
  description = "Resource Group Tags"
  default = {
    "Customer" = "ARSC",
    "Group"    = "Test"
  }
}

variable "group1_tags" {
  type        = map(string)
  description = "Resource Group Tags"
  default = {
    "Customer" = "ARSC",
    "Group"    = "Group1"
  }
}

variable "group2_tags" {
  type        = map(string)
  description = "Resource Group Tags"
  default = {
    "Customer" = "ARSC",
    "Group"    = "Group2"
  }
}


## Baseline Vars ##
variable "baseline_id" {
  type    = string
  default = "arn:aws:ssm:us-east-2:601722232065:patchbaseline/pb-0e8aa047d27be672c" #pb-0ff74b77ccb289397 IMSMSO-DefaultPatchBaseline
}

# Placeholder approved and rejected patches vars
/*variable "windows_approved_patches" {
  type    = list(string)
    default = ["KB123456"]
}

variable "windows_rejected_patches" {
  type    = list(string)
    default = ["KB123456"]
}*/
