# terraform-module-aws-batch-job

Terraform module to create and schedule an AWS Batch Job.

This module doesn't create the Batch compute environment, you can call [our batch module](https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/terraform-module-aws-batch) in order to create it (please take a look at [examples/default/](examples/default/)).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_batch_job_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_definition) | resource |
| [aws_cloudwatch_event_rule.event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.schedule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.schedule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_iam_policy.service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.execution_role_extras_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.events_assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.events_batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.tasks_assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_event_pattern"></a> [event\_pattern](#input\_event\_pattern) | The event pattern described a JSON object. At least one of schedule\_expression or event\_pattern is required. See full documentation of Events and Event Patterns in EventBridge for details. | `string` | `null` | no |
| <a name="input_event_policy_description"></a> [event\_policy\_description](#input\_event\_policy\_description) | Description of the IAM policy (var.name will be appended). | `string` | `"Service Role for EventBridge / Batch Job"` | no |
| <a name="input_event_policy_name"></a> [event\_policy\_name](#input\_event\_policy\_name) | Name of the policy (\_var.name will be appended). | `string` | `"AWS_Events_Invoke_Batch_Job_Queue"` | no |
| <a name="input_event_role_arn"></a> [event\_role\_arn](#input\_event\_role\_arn) | When event\_role\_create == false, external Service Role ARN | `string` | `null` | no |
| <a name="input_event_role_create"></a> [event\_role\_create](#input\_event\_role\_create) | Whether or not to create IAM resources for EventBridge. | `bool` | `true` | no |
| <a name="input_event_role_description"></a> [event\_role\_description](#input\_event\_role\_description) | Description of the IAM role (var.name will be appended). | `string` | `"Service Role for EventBridge / Batch Job"` | no |
| <a name="input_event_role_name"></a> [event\_role\_name](#input\_event\_role\_name) | Name of the role (\_var.name will be appended). | `string` | `"AWS_Events_Invoke_Batch_Job_Queue"` | no |
| <a name="input_event_role_path"></a> [event\_role\_path](#input\_event\_role\_path) | Path in which to create the policy. | `string` | `"/service-role/"` | no |
| <a name="input_event_rule_target_id"></a> [event\_rule\_target\_id](#input\_event\_rule\_target\_id) | The unique target assignment ID. Will be prefixed with var.prefix and sufixed by -onsched/onevent. | `string` | `"batchjob"` | no |
| <a name="input_event_rules_bus_name"></a> [event\_rules\_bus\_name](#input\_event\_rules\_bus\_name) | The event bus to associate with this rule. If you omit this, the default event bus is used. | `string` | `null` | no |
| <a name="input_event_rules_create"></a> [event\_rules\_create](#input\_event\_rules\_create) | Whether or not to create a EventBridge rule | `bool` | `true` | no |
| <a name="input_event_rules_description"></a> [event\_rules\_description](#input\_event\_rules\_description) | The description of the rule. | `string` | `"Run batch job based on event or schedule"` | no |
| <a name="input_event_rules_is_enabled"></a> [event\_rules\_is\_enabled](#input\_event\_rules\_is\_enabled) | Whether or not to enable EventBridge Rule | `bool` | `true` | no |
| <a name="input_event_rules_name"></a> [event\_rules\_name](#input\_event\_rules\_name) | Rule name (will be prefixed with 'var.prefix-job-' and sufixed with '-onsched/onevent'). If null, the rule will use var.name | `string` | `null` | no |
| <a name="input_event_rules_role"></a> [event\_rules\_role](#input\_event\_rules\_role) | The Amazon Resource Name (ARN) associated with the role that is used for target invocation. | `string` | `null` | no |
| <a name="input_event_tags"></a> [event\_tags](#input\_event\_tags) | Map of tags that will be applied on EventBridge and IAM resources (merged on local.tags, var.tags). | `map(string)` | `{}` | no |
| <a name="input_execution_role_create"></a> [execution\_role\_create](#input\_execution\_role\_create) | Whether or not to create the IAM execution role. | `bool` | `true` | no |
| <a name="input_execution_role_description"></a> [execution\_role\_description](#input\_execution\_role\_description) | Description of the IAM role for executing task (var.name will be appended). | `string` | `"Execution role for tasks"` | no |
| <a name="input_execution_role_extras_policies"></a> [execution\_role\_extras\_policies](#input\_execution\_role\_extras\_policies) | Extra policies ARN to attach to the execution role | `list(string)` | `[]` | no |
| <a name="input_execution_role_path"></a> [execution\_role\_path](#input\_execution\_role\_path) | Path in which to create the policy for executing task. | `string` | `"/"` | no |
| <a name="input_execution_role_tags"></a> [execution\_role\_tags](#input\_execution\_role\_tags) | Map of tags that will be applied on IAM resources for execution role (merged on local.tags, var.tags). | `map(string)` | `{}` | no |
| <a name="input_job_arn"></a> [job\_arn](#input\_job\_arn) | When job\_create == false, external job definition ARN | `string` | `null` | no |
| <a name="input_job_create"></a> [job\_create](#input\_job\_create) | Whether or not to create a job definition | `bool` | `true` | no |
| <a name="input_job_queue_arn"></a> [job\_queue\_arn](#input\_job\_queue\_arn) | External Batch Job Queue ARN | `string` | n/a | yes |
| <a name="input_job_tags"></a> [job\_tags](#input\_job\_tags) | Map of tags that will be applied on job definition (merged on local.tags, var.tags). | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of your job, will be use by Job definition and EventBridge resources. | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | (Optional) Specifies the parameter substitution placeholders to set in the job definition. | `map(string)` | `{}` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix to be added to with all resource's names of the module. Prefix is mainly used for tests and should remain empty in normal circumstances. | `string` | `""` | no |
| <a name="input_properties"></a> [properties](#input\_properties) | A valid container properties provided as a map (see an example here https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_definition / container\_properties). | `any` | n/a | yes |
| <a name="input_retries"></a> [retries](#input\_retries) | The number of times to move a job to the RUNNABLE status. You may specify between 1 and 10 attempts. | `number` | `1` | no |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule\_expression or event\_pattern is required. Can only be used on the default event bus. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags that will be applied on all resources. | `map(string)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | (Optional) The time duration in seconds after which AWS Batch terminates your jobs if they have not finished. The minimum value for the timeout is 60 seconds. | `number` | `null` | no |

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

## Versioning

This repository follows [Semantic Versioning 2.0.0](https://semver.org/)

## Git Hooks

This repository uses [pre-commit](https://pre-commit.com/) hooks.
