locals {
  testgroup_name      = "${var.testgroup_tags["Customer"]}-${var.testgroup_tags["Product"]}-${var.testgroup_tags["Patch Group"]}"
  mdb1_name           = "${var.mdb1_tags["Customer"]}-${var.mdb1_tags["Product"]}-${var.mdb1_tags["Patch Group"]}"
  mdb2_name           = "${var.mdb2_tags["Customer"]}-${var.mdb2_tags["Product"]}-${var.mdb2_tags["Patch Group"]}"
  group1_name         = "${var.group1_tags["Customer"]}-${var.group1_tags["Product"]}-${var.group1_tags["Patch Group"]}"
  group2_name         = "${var.group2_tags["Customer"]}-${var.group2_tags["Product"]}-${var.group2_tags["Patch Group"]}"
  testgroup_window_id = module.testgroup-window.maintenance-window-id
  mdb1_window_id      = module.mdb1-window.maintenance-window-id
  mdb2_window_id      = module.mdb2-window.maintenance-window-id
  group1_window_id    = module.group1-window.maintenance-window-id
  group2_window_id    = module.group2-window.maintenance-window-id
  testgroup_query     = <<JSON
{
    "ResourceTypeFilters": ["AWS::SSM::ManagedInstance"],
    "TagFilters": [
        {
            "Key": "Customer",
            "Values": ["${var.testgroup_tags["Customer"]}"]
        },
        {
            "Key": "Patch Group",
            "Values": ["${var.testgroup_tags["Patch Group"]}"]
        },
        {
            "Key": "Product",
            "Values": ["${var.testgroup_tags["Product"]}"]
        }
    ]
}
JSON
  mdb1_query          = <<JSON
{
    "ResourceTypeFilters": ["AWS::SSM::ManagedInstance"],
    "TagFilters": [
        {
            "Key": "Customer",
            "Values": ["${var.mdb1_tags["Customer"]}"]
        },
        {
            "Key": "Patch Group",
            "Values": ["${var.mdb1_tags["Patch Group"]}"]
        },
        {
            "Key": "Product",
            "Values": ["${var.mdb1_tags["Product"]}"]
        }
    ]
}
JSON
  mdb2_query          = <<JSON
{
    "ResourceTypeFilters": ["AWS::SSM::ManagedInstance"],
    "TagFilters": [
        {
            "Key": "Customer",
            "Values": ["${var.mdb2_tags["Customer"]}"]
        },
        {
            "Key": "Patch Group",
            "Values": ["${var.mdb2_tags["Patch Group"]}"]
        },
        {
            "Key": "Product",
            "Values": ["${var.mdb2_tags["Product"]}"]
        }
    ]
}
JSON
  group1_query        = <<JSON
{
    "ResourceTypeFilters": ["AWS::SSM::ManagedInstance"],
    "TagFilters": [
        {
            "Key": "Customer",
            "Values": ["${var.group1_tags["Customer"]}"]
        },
        {
            "Key": "Patch Group",
            "Values": ["${var.group1_tags["Patch Group"]}"]
        },
        {
            "Key": "Product",
            "Values": ["${var.group1_tags["Product"]}"]
        }
    ]
}
JSON
  group2_query        = <<JSON
{
    "ResourceTypeFilters": ["AWS::SSM::ManagedInstance"],
    "TagFilters": [
        {
            "Key": "Customer",
            "Values": ["${var.group2_tags["Customer"]}"]
        },
        {
            "Key": "Patch Group",
            "Values": ["${var.group2_tags["Patch Group"]}"]
        },
        {
            "Key": "Product",
            "Values": ["${var.group2_tags["Product"]}"]
        }
    ]
}
JSON
}
