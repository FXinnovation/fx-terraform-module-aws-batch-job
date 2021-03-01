# terraform-module-aws-batch-job

Terraform module to create and schedule an AWS Batch Job.

This module doesn't create the Batch compute environment, you can call [our batch module](https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/terraform-module-aws-batch) in order to create it (please take a look at [examples/default/](examples/default/)).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_batch_job_definition](https://registry.terraform.io/providers/hashicorp/aws/3.0/docs/resources/batch_job_definition) |
| [aws_cloudwatch_event_rule](https://registry.terraform.io/providers/hashicorp/aws/3.0/docs/resources/cloudwatch_event_rule) |
| [aws_cloudwatch_event_target](https://registry.terraform.io/providers/hashicorp/aws/3.0/docs/resources/cloudwatch_event_target) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/3.0/docs/data-sources/iam_policy_document) |
| [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/3.0/docs/resources/iam_policy) |
| [aws_iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/3.0/docs/resources/iam_role_policy_attachment) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/3.0/docs/resources/iam_role) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| event\_pattern | The event pattern described a JSON object. At least one of schedule\_expression or event\_pattern is required. See full documentation of Events and Event Patterns in EventBridge for details. | `string` | `null` | no |
| event\_policy\_description | Description of the IAM policy (var.name will be appended). | `string` | `"Service Role for EventBridge / Batch Job"` | no |
| event\_policy\_name | Name of the policy (\_var.name will be appended). | `string` | `"AWS_Events_Invoke_Batch_Job_Queue"` | no |
| event\_role\_arn | When event\_role\_create == false, external Service Role ARN | `string` | `null` | no |
| event\_role\_create | Whether or not to create IAM resources for EventBridge. | `bool` | `true` | no |
| event\_role\_description | Description of the IAM role (var.name will be appended). | `string` | `"Service Role for EventBridge / Batch Job"` | no |
| event\_role\_name | Name of the role (\_var.name will be appended). | `string` | `"AWS_Events_Invoke_Batch_Job_Queue"` | no |
| event\_role\_path | Path in which to create the policy. | `string` | `"/service-role/"` | no |
| event\_rule\_target\_id | The unique target assignment ID. Will be prefixed with var.prefix and sufixed by -onsched/onevent. | `string` | `"batchjob"` | no |
| event\_rules\_bus\_name | The event bus to associate with this rule. If you omit this, the default event bus is used. | `string` | `null` | no |
| event\_rules\_create | Whether or not to create a EventBridge rule | `bool` | `true` | no |
| event\_rules\_description | The description of the rule. | `string` | `"Run batch job based on event or schedule"` | no |
| event\_rules\_is\_enabled | Whether or not to enable EventBridge Rule | `bool` | `true` | no |
| event\_rules\_name | Rule name (will be prefixed with 'var.prefix-job-' and sufixed with '-onsched/onevent'). If null, the rule will use var.name | `string` | `null` | no |
| event\_rules\_role | The Amazon Resource Name (ARN) associated with the role that is used for target invocation. | `string` | `null` | no |
| event\_tags | Map of tags that will be applied on EventBridge and IAM resources. | `map(string)` | `{}` | no |
| job\_arn | When job\_create == false, external job definition ARN | `string` | `null` | no |
| job\_create | Whether or not to create a job definition | `bool` | `true` | no |
| job\_queue\_arn | External Batch Job Queue ARN | `string` | n/a | yes |
| job\_tags | Map of tags that will be applied on job definition. | `map(string)` | `{}` | no |
| name | Name of your job, will be use by Job definition and EventBridge resources. | `string` | n/a | yes |
| parameters | (Optional) Specifies the parameter substitution placeholders to set in the job definition. | `map(string)` | `{}` | no |
| prefix | Prefix to be added to with all resource's names of the module. Prefix is mainly used for tests and should remain empty in normal circumstances. | `string` | `""` | no |
| properties | A valid container properties provided as a single valid JSON document. | `string` | n/a | yes |
| retries | The number of times to move a job to the RUNNABLE status. You may specify between 1 and 10 attempts. | `number` | `1` | no |
| schedule\_expression | The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule\_expression or event\_pattern is required. Can only be used on the default event bus. | `string` | `null` | no |
| tags | Map of tags that will be applied on all resources. | `map(string)` | `{}` | no |
| timeout | (Optional) The time duration in seconds after which AWS Batch terminates your jobs if they have not finished. The minimum value for the timeout is 60 seconds. | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name of the job definition. |
| revision | The revision of the job definition. |
| rule\_event\_arn | The Amazon Resource Name (ARN) of the rule. |
| rule\_event\_id | The name of the rule. |
| rule\_schedule\_arn | The Amazon Resource Name (ARN) of the rule. |
| rule\_schedule\_id | The name of the rule. |
| service\_policy\_arn | The ARN assigned by AWS to this policy. |
| service\_policy\_description | The description of the policy. |
| service\_policy\_id | The policy's ID. |
| service\_policy\_name | The name of the policy. |
| service\_policy\_path | The path of the policy in IAM. |
| service\_policy\_policy | The policy document. |
| service\_role\_arn | The Amazon Resource Name (ARN) specifying the role. |
| service\_role\_create\_date | The creation date of the IAM role. |
| service\_role\_description | The description of the role. |
| service\_role\_id | The name of the role. |
| service\_role\_name | The name of the role. |
| service\_role\_unique\_id | The stable and unique string identifying the role. |
| target\_event\_arn | CloudWatch Event Target Arn. |
| target\_schedule\_arn | CloudWatch Event Target Arn. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning

This repository follows [Semantic Versioning 2.0.0](https://semver.org/)

## Git Hooks

This repository uses [pre-commit](https://pre-commit.com/) hooks.
