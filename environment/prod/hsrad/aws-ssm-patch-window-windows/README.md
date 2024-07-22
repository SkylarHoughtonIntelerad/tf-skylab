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
| <a name="module_group1-evac-target"></a> [group1-evac-target](#module\_group1-evac-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_group1-evac-windows"></a> [group1-evac-windows](#module\_group1-evac-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_group1-patch"></a> [group1-patch](#module\_group1-patch) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | v4.13.2 |
| <a name="module_group1-patch-target"></a> [group1-patch-target](#module\_group1-patch-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_group1-patch-window"></a> [group1-patch-window](#module\_group1-patch-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | v4.11.0 |
| <a name="module_group1-patchgroup"></a> [group1-patchgroup](#module\_group1-patchgroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group | v4.13.2 |
| <a name="module_group1-reboot"></a> [group1-reboot](#module\_group1-reboot) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | v4.13.2 |
| <a name="module_group1-reboot-target"></a> [group1-reboot-target](#module\_group1-reboot-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_group1-reboot-window"></a> [group1-reboot-window](#module\_group1-reboot-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | v4.11.0 |
| <a name="module_group1-resourcegroup"></a> [group1-resourcegroup](#module\_group1-resourcegroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group | v4.13.2 |
| <a name="module_group1-start-windows"></a> [group1-start-windows](#module\_group1-start-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_group1-stop-windows"></a> [group1-stop-windows](#module\_group1-stop-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_group2-evac-target"></a> [group2-evac-target](#module\_group2-evac-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_group2-evac-windows"></a> [group2-evac-windows](#module\_group2-evac-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_group2-patch"></a> [group2-patch](#module\_group2-patch) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | v4.13.2 |
| <a name="module_group2-patch-target"></a> [group2-patch-target](#module\_group2-patch-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_group2-patch-window"></a> [group2-patch-window](#module\_group2-patch-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | v4.11.0 |
| <a name="module_group2-patchgroup"></a> [group2-patchgroup](#module\_group2-patchgroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group | v4.13.2 |
| <a name="module_group2-reboot"></a> [group2-reboot](#module\_group2-reboot) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | v4.13.2 |
| <a name="module_group2-reboot-target"></a> [group2-reboot-target](#module\_group2-reboot-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_group2-reboot-window"></a> [group2-reboot-window](#module\_group2-reboot-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | v4.11.0 |
| <a name="module_group2-resourcegroup"></a> [group2-resourcegroup](#module\_group2-resourcegroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group | v4.13.2 |
| <a name="module_group2-start-windows"></a> [group2-start-windows](#module\_group2-start-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_group2-stop-windows"></a> [group2-stop-windows](#module\_group2-stop-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_mdb1-evac-target"></a> [mdb1-evac-target](#module\_mdb1-evac-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_mdb1-evac-windows"></a> [mdb1-evac-windows](#module\_mdb1-evac-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_mdb1-patch"></a> [mdb1-patch](#module\_mdb1-patch) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | v4.13.2 |
| <a name="module_mdb1-patch-target"></a> [mdb1-patch-target](#module\_mdb1-patch-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_mdb1-patch-window"></a> [mdb1-patch-window](#module\_mdb1-patch-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | v4.11.0 |
| <a name="module_mdb1-patchgroup"></a> [mdb1-patchgroup](#module\_mdb1-patchgroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group | v4.13.2 |
| <a name="module_mdb1-reboot"></a> [mdb1-reboot](#module\_mdb1-reboot) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | v4.13.2 |
| <a name="module_mdb1-reboot-target"></a> [mdb1-reboot-target](#module\_mdb1-reboot-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_mdb1-reboot-window"></a> [mdb1-reboot-window](#module\_mdb1-reboot-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | v4.11.0 |
| <a name="module_mdb1-resourcegroup"></a> [mdb1-resourcegroup](#module\_mdb1-resourcegroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group | v4.13.2 |
| <a name="module_mdb1-start-windows"></a> [mdb1-start-windows](#module\_mdb1-start-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_mdb1-stop-windows"></a> [mdb1-stop-windows](#module\_mdb1-stop-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_mdb2-evac-target"></a> [mdb2-evac-target](#module\_mdb2-evac-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_mdb2-evac-windows"></a> [mdb2-evac-windows](#module\_mdb2-evac-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_mdb2-patch"></a> [mdb2-patch](#module\_mdb2-patch) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | v4.13.2 |
| <a name="module_mdb2-patch-target"></a> [mdb2-patch-target](#module\_mdb2-patch-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_mdb2-patch-window"></a> [mdb2-patch-window](#module\_mdb2-patch-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | v4.11.0 |
| <a name="module_mdb2-patchgroup"></a> [mdb2-patchgroup](#module\_mdb2-patchgroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group | v4.13.2 |
| <a name="module_mdb2-reboot"></a> [mdb2-reboot](#module\_mdb2-reboot) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | v4.13.2 |
| <a name="module_mdb2-reboot-target"></a> [mdb2-reboot-target](#module\_mdb2-reboot-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_mdb2-reboot-window"></a> [mdb2-reboot-window](#module\_mdb2-reboot-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | v4.11.0 |
| <a name="module_mdb2-resourcegroup"></a> [mdb2-resourcegroup](#module\_mdb2-resourcegroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group | v4.13.2 |
| <a name="module_mdb2-start-windows"></a> [mdb2-start-windows](#module\_mdb2-start-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_mdb2-stop-windows"></a> [mdb2-stop-windows](#module\_mdb2-stop-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_testgroup-evac-target"></a> [testgroup-evac-target](#module\_testgroup-evac-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_testgroup-evac-windows"></a> [testgroup-evac-windows](#module\_testgroup-evac-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_testgroup-patch"></a> [testgroup-patch](#module\_testgroup-patch) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | v4.13.2 |
| <a name="module_testgroup-patch-target"></a> [testgroup-patch-target](#module\_testgroup-patch-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_testgroup-patch-window"></a> [testgroup-patch-window](#module\_testgroup-patch-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | v4.11.0 |
| <a name="module_testgroup-patchgroup"></a> [testgroup-patchgroup](#module\_testgroup-patchgroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group | v4.13.2 |
| <a name="module_testgroup-reboot"></a> [testgroup-reboot](#module\_testgroup-reboot) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-task | v4.13.2 |
| <a name="module_testgroup-reboot-target"></a> [testgroup-reboot-target](#module\_testgroup-reboot-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | v4.13.2 |
| <a name="module_testgroup-reboot-window"></a> [testgroup-reboot-window](#module\_testgroup-reboot-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | v4.11.0 |
| <a name="module_testgroup-resourcegroup"></a> [testgroup-resourcegroup](#module\_testgroup-resourcegroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group | v4.13.2 |
| <a name="module_testgroup-start-windows"></a> [testgroup-start-windows](#module\_testgroup-start-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |
| <a name="module_testgroup-stop-windows"></a> [testgroup-stop-windows](#module\_testgroup-stop-windows) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-powershell-task | v4.13.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group1_tags"></a> [group1\_tags](#input\_group1\_tags) | Resource Group Tags | `map(string)` | <pre>{<br>  "Customer": "hsrad",<br>  "OS": "windows",<br>  "Patch_Group": "group1"<br>}</pre> | no |
| <a name="input_group2_tags"></a> [group2\_tags](#input\_group2\_tags) | Resource Group Tags | `map(string)` | <pre>{<br>  "Customer": "hsrad",<br>  "OS": "windows",<br>  "Patch_Group": "group2"<br>}</pre> | no |
| <a name="input_mdb1_tags"></a> [mdb1\_tags](#input\_mdb1\_tags) | Resource Group Tags | `map(string)` | <pre>{<br>  "Application": "mdb",<br>  "Customer": "hsrad",<br>  "OS": "windows",<br>  "Patch_Group": "mdb1"<br>}</pre> | no |
| <a name="input_mdb2_tags"></a> [mdb2\_tags](#input\_mdb2\_tags) | Resource Group Tags | `map(string)` | <pre>{<br>  "Application": "mdb",<br>  "Customer": "hsrad",<br>  "OS": "windows",<br>  "Patch_Group": "mdb2"<br>}</pre> | no |
| <a name="input_patch_parameters"></a> [patch\_parameters](#input\_patch\_parameters) | n/a | `map` | <pre>{<br>  "baseline_id": "pb-082994d4d2f5cf385",<br>  "max_concurrency": "60%",<br>  "max_errors": "20%",<br>  "service_role_arn": "arn:aws:iam::601722232065:role/SSMServiceRole"<br>}</pre> | no |
| <a name="input_patch_tasks"></a> [patch\_tasks](#input\_patch\_tasks) | n/a | <pre>list(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "name": "Operation",<br>    "values": [<br>      "Install"<br>    ]<br>  },<br>  {<br>    "name": "RebootOption",<br>    "values": [<br>      "NoReboot"<br>    ]<br>  },<br>  {<br>    "name": "PreInstallHookDocName",<br>    "values": [<br>      "AWS-Noop"<br>    ]<br>  },<br>  {<br>    "name": "PostInstallHookDocName",<br>    "values": [<br>      "AWS-Noop"<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_reboot_tasks"></a> [reboot\_tasks](#input\_reboot\_tasks) | n/a | <pre>list(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "name": "Operation",<br>    "values": [<br>      "Install"<br>    ]<br>  },<br>  {<br>    "name": "RebootOption",<br>    "values": [<br>      "RebootIfNeeded"<br>    ]<br>  },<br>  {<br>    "name": "PreInstallHookDocName",<br>    "values": [<br>      "AWS-Noop"<br>    ]<br>  },<br>  {<br>    "name": "PostInstallHookDocName",<br>    "values": [<br>      "AWS-Noop"<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_testgroup_tags"></a> [testgroup\_tags](#input\_testgroup\_tags) | Resource Group Tags | `map(string)` | <pre>{<br>  "Customer": "hsrad",<br>  "OS": "windows",<br>  "Patch_Group": "test"<br>}</pre> | no |
| <a name="input_timeout_seconds"></a> [timeout\_seconds](#input\_timeout\_seconds) | n/a | `number` | `600` | no |

## Outputs

No outputs.
