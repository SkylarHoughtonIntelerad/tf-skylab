locals {
  testgroup_name             = "${var.testgroup_tags["Customer"]}-${var.testgroup_tags["OS"]}-${var.testgroup_tags["Patch_Group"]}"
  mdb1_name                  = "${var.mdb1_tags["Customer"]}-${var.mdb1_tags["OS"]}-${var.mdb1_tags["Patch_Group"]}"
  mdb2_name                  = "${var.mdb2_tags["Customer"]}-${var.mdb2_tags["OS"]}-${var.mdb2_tags["Patch_Group"]}"
  group1_name                = "${var.group1_tags["Customer"]}-${var.group1_tags["OS"]}-${var.group1_tags["Patch_Group"]}"
  group2_name                = "${var.group2_tags["Customer"]}-${var.group2_tags["OS"]}-${var.group2_tags["Patch_Group"]}"
  testgroup_patch_window_id  = module.testgroup-patch-window.maintenance-window-id
  testgroup_reboot_window_id = module.testgroup-reboot-window.maintenance-window-id
  mdb1_patch_window_id       = module.mdb1-patch-window.maintenance-window-id
  mdb1_reboot_window_id      = module.mdb1-reboot-window.maintenance-window-id
  mdb2_patch_window_id       = module.mdb2-patch-window.maintenance-window-id
  mdb2_reboot_window_id      = module.mdb2-reboot-window.maintenance-window-id
  group1_patch_window_id     = module.group1-patch-window.maintenance-window-id
  group1_reboot_window_id    = module.group1-reboot-window.maintenance-window-id
  group2_patch_window_id     = module.group2-patch-window.maintenance-window-id
  group2_reboot_window_id    = module.group2-reboot-window.maintenance-window-id
  testgroup_query            = <<JSON
{
    "ResourceTypeFilters": ["AWS::SSM::ManagedInstance"],
    "TagFilters": [
        {
            "Key": "Customer",
            "Values": ["${var.testgroup_tags["Customer"]}"]
        },
        {
            "Key": "Patch_Group",
            "Values": ["${var.testgroup_tags["Patch_Group"]}"]
        },
        {
            "Key": "OS",
            "Values": ["${var.testgroup_tags["OS"]}"]
        }
    ]
}
JSON
  mdb1_query                 = <<JSON
{
    "ResourceTypeFilters": ["AWS::SSM::ManagedInstance"],
    "TagFilters": [
        {
            "Key": "Customer",
            "Values": ["${var.mdb1_tags["Customer"]}"]
        },
        {
            "Key": "Patch_Group",
            "Values": ["${var.mdb1_tags["Patch_Group"]}"]
        },
        {
            "Key": "OS",
            "Values": ["${var.mdb1_tags["OS"]}"]
        },
        {
            "Key": "Application",
            "Values": ["${var.mdb1_tags["Application"]}"]
        }
    ]
}
JSON
  mdb2_query                 = <<JSON
{
    "ResourceTypeFilters": ["AWS::SSM::ManagedInstance"],
    "TagFilters": [
        {
            "Key": "Customer",
            "Values": ["${var.mdb2_tags["Customer"]}"]
        },
        {
            "Key": "Patch_Group",
            "Values": ["${var.mdb2_tags["Patch_Group"]}"]
        },
        {
            "Key": "OS",
            "Values": ["${var.mdb2_tags["OS"]}"]
        },
        {
            "Key": "Application",
            "Values": ["${var.mdb2_tags["Application"]}"]
        }
    ]
}
JSON
  group1_query               = <<JSON
{
    "ResourceTypeFilters": ["AWS::SSM::ManagedInstance"],
    "TagFilters": [
        {
            "Key": "Customer",
            "Values": ["${var.group1_tags["Customer"]}"]
        },
        {
            "Key": "Patch_Group",
            "Values": ["${var.group1_tags["Patch_Group"]}"]
        },
        {
            "Key": "OS",
            "Values": ["${var.group1_tags["OS"]}"]
        }
    ]
}
JSON
  group2_query               = <<JSON
{
    "ResourceTypeFilters": ["AWS::SSM::ManagedInstance"],
    "TagFilters": [
        {
            "Key": "Customer",
            "Values": ["${var.group2_tags["Customer"]}"]
        },
        {
            "Key": "Patch_Group",
            "Values": ["${var.group2_tags["Patch_Group"]}"]
        },
        {
            "Key": "OS",
            "Values": ["${var.group2_tags["OS"]}"]
        }
    ]
}
JSON
}
