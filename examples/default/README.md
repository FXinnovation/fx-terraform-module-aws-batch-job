# Default example

## Usage

To run this example, you need to execute:

```
$ terraform init
$ terraform plan
$ terraform apply
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute_environment"></a> [compute\_environment](#module\_compute\_environment) | git::ssh://git@github.com/FXinnovation/fx-terraform-module-aws-batch.git | 1.0.0 |
| <a name="module_default"></a> [default](#module\_default) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.extra_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [random_string.prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_iam_policy_document.extra_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_subnet_ids.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Credentials: AWS access key. | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_execution_role_arn"></a> [execution\_role\_arn](#output\_execution\_role\_arn) | n/a |
| <a name="output_execution_role_create_date"></a> [execution\_role\_create\_date](#output\_execution\_role\_create\_date) | n/a |
| <a name="output_execution_role_description"></a> [execution\_role\_description](#output\_execution\_role\_description) | n/a |
| <a name="output_execution_role_id"></a> [execution\_role\_id](#output\_execution\_role\_id) | n/a |
| <a name="output_execution_role_name"></a> [execution\_role\_name](#output\_execution\_role\_name) | n/a |
| <a name="output_execution_role_unique_id"></a> [execution\_role\_unique\_id](#output\_execution\_role\_unique\_id) | n/a |
| <a name="output_revision"></a> [revision](#output\_revision) | n/a |
| <a name="output_rule_event_arn"></a> [rule\_event\_arn](#output\_rule\_event\_arn) | n/a |
| <a name="output_rule_event_id"></a> [rule\_event\_id](#output\_rule\_event\_id) | n/a |
| <a name="output_rule_schedule_arn"></a> [rule\_schedule\_arn](#output\_rule\_schedule\_arn) | n/a |
| <a name="output_rule_schedule_id"></a> [rule\_schedule\_id](#output\_rule\_schedule\_id) | n/a |
| <a name="output_service_policy_arn"></a> [service\_policy\_arn](#output\_service\_policy\_arn) | n/a |
| <a name="output_service_policy_description"></a> [service\_policy\_description](#output\_service\_policy\_description) | n/a |
| <a name="output_service_policy_id"></a> [service\_policy\_id](#output\_service\_policy\_id) | n/a |
| <a name="output_service_policy_name"></a> [service\_policy\_name](#output\_service\_policy\_name) | n/a |
| <a name="output_service_policy_path"></a> [service\_policy\_path](#output\_service\_policy\_path) | n/a |
| <a name="output_service_policy_policy"></a> [service\_policy\_policy](#output\_service\_policy\_policy) | n/a |
| <a name="output_service_role_arn"></a> [service\_role\_arn](#output\_service\_role\_arn) | n/a |
| <a name="output_service_role_create_date"></a> [service\_role\_create\_date](#output\_service\_role\_create\_date) | n/a |
| <a name="output_service_role_description"></a> [service\_role\_description](#output\_service\_role\_description) | n/a |
| <a name="output_service_role_id"></a> [service\_role\_id](#output\_service\_role\_id) | n/a |
| <a name="output_service_role_name"></a> [service\_role\_name](#output\_service\_role\_name) | n/a |
| <a name="output_service_role_unique_id"></a> [service\_role\_unique\_id](#output\_service\_role\_unique\_id) | n/a |
| <a name="output_target_event_arn"></a> [target\_event\_arn](#output\_target\_event\_arn) | n/a |
| <a name="output_target_schedule_arn"></a> [target\_schedule\_arn](#output\_target\_schedule\_arn) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
