## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_group1-patch-window"></a> [group1-patch-window](#module\_group1-patch-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_group1-reboot-window"></a> [group1-reboot-window](#module\_group1-reboot-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_group2-patch-window"></a> [group2-patch-window](#module\_group2-patch-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_group2-reboot-window"></a> [group2-reboot-window](#module\_group2-reboot-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_testgroup-patch-window"></a> [testgroup-patch-window](#module\_testgroup-patch-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |
| <a name="module_testgroup-reboot-window"></a> [testgroup-reboot-window](#module\_testgroup-reboot-window) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/ssm-maintenance-window | master |

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
