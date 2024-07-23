## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.21.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.40.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_account_vars"></a> [account\_vars](#module\_account\_vars) | ../account-vars | n/a |
| <a name="module_eventbridge-use2"></a> [eventbridge-use2](#module\_eventbridge-use2) | git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/eventbridge | PLT-2629 |

## Resources

| Name | Type |
|------|------|
| [aws_lambda_function.lambda_use2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lambda_function) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
