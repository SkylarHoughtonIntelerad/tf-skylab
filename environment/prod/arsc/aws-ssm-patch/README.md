## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.63.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_group1-evac-target"></a> [group1-evac-target](#module\_group1-evac-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | master |
| <a name="module_group1-patch"></a> [group1-patch](#module\_group1-patch) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-noreboot | master |
| <a name="module_group1-patch-target"></a> [group1-patch-target](#module\_group1-patch-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | master |
| <a name="module_group1-patch-window"></a> [group1-patch-window](#module\_group1-patch-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_group1-patchgroup"></a> [group1-patchgroup](#module\_group1-patchgroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group | master |
| <a name="module_group1-reboot"></a> [group1-reboot](#module\_group1-reboot) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-reboot | master |
| <a name="module_group1-reboot-target"></a> [group1-reboot-target](#module\_group1-reboot-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | master |
| <a name="module_group1-reboot-window"></a> [group1-reboot-window](#module\_group1-reboot-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_group1-resourcegroup"></a> [group1-resourcegroup](#module\_group1-resourcegroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group-patch-groups | master |
| <a name="module_group1-win-evac"></a> [group1-win-evac](#module\_group1-win-evac) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-evac | master |
| <a name="module_group1-win-start-services"></a> [group1-win-start-services](#module\_group1-win-start-services) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-start-services | master |
| <a name="module_group1-win-stop-services"></a> [group1-win-stop-services](#module\_group1-win-stop-services) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-stop-services | master |
| <a name="module_group2-evac-target"></a> [group2-evac-target](#module\_group2-evac-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | master |
| <a name="module_group2-patch"></a> [group2-patch](#module\_group2-patch) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-noreboot | master |
| <a name="module_group2-patch-target"></a> [group2-patch-target](#module\_group2-patch-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | master |
| <a name="module_group2-patch-window"></a> [group2-patch-window](#module\_group2-patch-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_group2-patchgroup"></a> [group2-patchgroup](#module\_group2-patchgroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group | master |
| <a name="module_group2-reboot"></a> [group2-reboot](#module\_group2-reboot) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-reboot | master |
| <a name="module_group2-reboot-target"></a> [group2-reboot-target](#module\_group2-reboot-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | master |
| <a name="module_group2-reboot-window"></a> [group2-reboot-window](#module\_group2-reboot-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_group2-resourcegroup"></a> [group2-resourcegroup](#module\_group2-resourcegroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group-patch-groups | master |
| <a name="module_group2-win-evac"></a> [group2-win-evac](#module\_group2-win-evac) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-evac | master |
| <a name="module_group2-win-start-services"></a> [group2-win-start-services](#module\_group2-win-start-services) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-start-services | master |
| <a name="module_group2-win-stop-services"></a> [group2-win-stop-services](#module\_group2-win-stop-services) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-win-stop-services | master |
| <a name="module_testgroup-patch"></a> [testgroup-patch](#module\_testgroup-patch) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-noreboot | master |
| <a name="module_testgroup-patch-target"></a> [testgroup-patch-target](#module\_testgroup-patch-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | master |
| <a name="module_testgroup-patch-window"></a> [testgroup-patch-window](#module\_testgroup-patch-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_testgroup-patchgroup"></a> [testgroup-patchgroup](#module\_testgroup-patchgroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-patch-group | master |
| <a name="module_testgroup-reboot"></a> [testgroup-reboot](#module\_testgroup-reboot) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-task-patch-reboot | master |
| <a name="module_testgroup-reboot-target"></a> [testgroup-reboot-target](#module\_testgroup-reboot-target) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-target | master |
| <a name="module_testgroup-reboot-window"></a> [testgroup-reboot-window](#module\_testgroup-reboot-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_testgroup-resourcegroup"></a> [testgroup-resourcegroup](#module\_testgroup-resourcegroup) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/resource-group-patch-groups | master |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_baseline_id"></a> [baseline\_id](#input\_baseline\_id) | # Baseline Vars ## | `string` | `"arn:aws:ssm:us-east-2:601722232065:patchbaseline/pb-0e8aa047d27be672c"` | no |
| <a name="input_description"></a> [description](#input\_description) | Default Description | `string` | `"ARSC"` | no |
| <a name="input_group1_tags"></a> [group1\_tags](#input\_group1\_tags) | Resource Group Tags | `map(string)` | <pre>{<br>  "Customer": "ARSC",<br>  "Group": "Group1"<br>}</pre> | no |
| <a name="input_group2_tags"></a> [group2\_tags](#input\_group2\_tags) | Resource Group Tags | `map(string)` | <pre>{<br>  "Customer": "ARSC",<br>  "Group": "Group2"<br>}</pre> | no |
| <a name="input_testgroup_tags"></a> [testgroup\_tags](#input\_testgroup\_tags) | Resource Group Tags | `map(string)` | <pre>{<br>  "Customer": "ARSC",<br>  "Group": "Test"<br>}</pre> | no |

## Outputs

No outputs.
