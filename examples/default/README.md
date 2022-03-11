# Default example

## Usage

```
# terraform init
# terraform apply
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.0 |
| random | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |
| random | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| compute_environment | git::https://github.com/FXinnovation/fx-terraform-module-aws-batch.git?ref=0.1.1 |  |
| default | ../../ |  |

## Resources

| Name |
|------|
| [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) |
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) |
| [random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | Credentials: AWS access key. | `string` | n/a | yes |
| secret\_key | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| execution\_role\_arn | n/a |
| execution\_role\_create\_date | n/a |
| execution\_role\_description | n/a |
| execution\_role\_id | n/a |
| execution\_role\_name | n/a |
| execution\_role\_unique\_id | n/a |
| revision | n/a |
| rule\_event\_arn | n/a |
| rule\_event\_id | n/a |
| rule\_schedule\_arn | n/a |
| rule\_schedule\_id | n/a |
| service\_policy\_arn | n/a |
| service\_policy\_description | n/a |
| service\_policy\_id | n/a |
| service\_policy\_name | n/a |
| service\_policy\_path | n/a |
| service\_policy\_policy | n/a |
| service\_role\_arn | n/a |
| service\_role\_create\_date | n/a |
| service\_role\_description | n/a |
| service\_role\_id | n/a |
| service\_role\_name | n/a |
| service\_role\_unique\_id | n/a |
| target\_event\_arn | n/a |
| target\_schedule\_arn | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
