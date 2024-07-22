## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.21.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_group1-check-pacs"></a> [group1-check-pacs](#module\_group1-check-pacs) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task | master |
| <a name="module_group1-patch"></a> [group1-patch](#module\_group1-patch) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task | master |
| <a name="module_group1-patch-scan"></a> [group1-patch-scan](#module\_group1-patch-scan) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | master |
| <a name="module_group1-patchgroup"></a> [group1-patchgroup](#module\_group1-patchgroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group | master |
| <a name="module_group1-resourcegroup"></a> [group1-resourcegroup](#module\_group1-resourcegroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group | master |
| <a name="module_group1-start-pacs"></a> [group1-start-pacs](#module\_group1-start-pacs) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task | master |
| <a name="module_group1-target"></a> [group1-target](#module\_group1-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | master |
| <a name="module_group1-window"></a> [group1-window](#module\_group1-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_group2-check-pacs"></a> [group2-check-pacs](#module\_group2-check-pacs) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task | master |
| <a name="module_group2-patch"></a> [group2-patch](#module\_group2-patch) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task | master |
| <a name="module_group2-patch-scan"></a> [group2-patch-scan](#module\_group2-patch-scan) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | master |
| <a name="module_group2-patchgroup"></a> [group2-patchgroup](#module\_group2-patchgroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group | master |
| <a name="module_group2-resourcegroup"></a> [group2-resourcegroup](#module\_group2-resourcegroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group | master |
| <a name="module_group2-start-pacs"></a> [group2-start-pacs](#module\_group2-start-pacs) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task | master |
| <a name="module_group2-target"></a> [group2-target](#module\_group2-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | master |
| <a name="module_group2-window"></a> [group2-window](#module\_group2-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_testgroup-check-pacs"></a> [testgroup-check-pacs](#module\_testgroup-check-pacs) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task | master |
| <a name="module_testgroup-patch"></a> [testgroup-patch](#module\_testgroup-patch) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task | master |
| <a name="module_testgroup-patch-scan"></a> [testgroup-patch-scan](#module\_testgroup-patch-scan) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | master |
| <a name="module_testgroup-patchgroup"></a> [testgroup-patchgroup](#module\_testgroup-patchgroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group | master |
| <a name="module_testgroup-resourcegroup"></a> [testgroup-resourcegroup](#module\_testgroup-resourcegroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group | master |
| <a name="module_testgroup-start-pacs"></a> [testgroup-start-pacs](#module\_testgroup-start-pacs) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-shell-task | master |
| <a name="module_testgroup-target"></a> [testgroup-target](#module\_testgroup-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | master |
| <a name="module_testgroup-window"></a> [testgroup-window](#module\_testgroup-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group1_tags"></a> [group1\_tags](#input\_group1\_tags) | Resource Group Tags | `map(string)` | <pre>{<br>  "Customer": "hsrad",<br>  "Patch Group": "group1",<br>  "Product": "intelepacs"<br>}</pre> | no |
| <a name="input_group2_tags"></a> [group2\_tags](#input\_group2\_tags) | Resource Group Tags | `map(string)` | <pre>{<br>  "Customer": "hsrad",<br>  "Patch Group": "group2",<br>  "Product": "intelepacs"<br>}</pre> | no |
| <a name="input_patch_parameters"></a> [patch\_parameters](#input\_patch\_parameters) | n/a | `map` | <pre>{<br>  "baseline_id": "pb-0b4048a445028990a",<br>  "max_concurrency": "60%",<br>  "max_errors": "20%",<br>  "service_role_arn": "arn:aws:iam::601722232065:role/SSMServiceRole"<br>}</pre> | no |
| <a name="input_patch_tasks"></a> [patch\_tasks](#input\_patch\_tasks) | n/a | <pre>list(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "name": "Operation",<br>    "values": [<br>      "Scan"<br>    ]<br>  },<br>  {<br>    "name": "RebootOption",<br>    "values": [<br>      "NoReboot"<br>    ]<br>  },<br>  {<br>    "name": "PreInstallHookDocName",<br>    "values": [<br>      "AWS-Noop"<br>    ]<br>  },<br>  {<br>    "name": "PostInstallHookDocName",<br>    "values": [<br>      "AWS-Noop"<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_reboot_tasks"></a> [reboot\_tasks](#input\_reboot\_tasks) | n/a | <pre>list(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "name": "Operation",<br>    "values": [<br>      "Install"<br>    ]<br>  },<br>  {<br>    "name": "RebootOption",<br>    "values": [<br>      "RebootIfNeeded"<br>    ]<br>  },<br>  {<br>    "name": "PreInstallHookDocName",<br>    "values": [<br>      "AWS-Noop"<br>    ]<br>  },<br>  {<br>    "name": "PostInstallHookDocName",<br>    "values": [<br>      "AWS-Noop"<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_testgroup_tags"></a> [testgroup\_tags](#input\_testgroup\_tags) | Resource Group Tags | `map(string)` | <pre>{<br>  "Customer": "hsrad",<br>  "Patch Group": "test",<br>  "Product": "intelepacs"<br>}</pre> | no |
| <a name="input_timeout_seconds"></a> [timeout\_seconds](#input\_timeout\_seconds) | n/a | `number` | `600` | no |

## Outputs

No outputs.
