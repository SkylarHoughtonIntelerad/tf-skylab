## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.64.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_account_vars"></a> [account\_vars](#module\_account\_vars) | ../account-vars | n/a |
| <a name="module_common_policies"></a> [common\_policies](#module\_common\_policies) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/common/policies | master |
| <a name="module_custom_policies"></a> [custom\_policies](#module\_custom\_policies) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/iam-policy-doc | master |
| <a name="module_iam_instance_profile"></a> [iam\_instance\_profile](#module\_iam\_instance\_profile) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/iam-role | master |
| <a name="module_iam_irsa"></a> [iam\_irsa](#module\_iam\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.30.2 |
| <a name="module_iam_role"></a> [iam\_role](#module\_iam\_role) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/iam-role | master |
| <a name="module_local_policies"></a> [local\_policies](#module\_local\_policies) | ./policies | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oidc_provider_arns"></a> [oidc\_provider\_arns](#input\_oidc\_provider\_arns) | n/a | `map` | <pre>{<br>  "ambra-uat": "arn:aws:iam::150552228373:oidc-provider/oidc.eks.us-east-2.amazonaws.com/id/B02C59E636827D1DBDB1A89BEF6D9107"<br>}</pre> | no |

## Outputs

No outputs.
