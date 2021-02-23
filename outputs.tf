#####
# Batch Job
#####

output "arn" {
  description = "The Amazon Resource Name of the job definition."
  value       = concat(aws_batch_job_definition.this.*.arn, [""])[0]
}

output "revision" {
  description = "The revision of the job definition."
  value       = concat(aws_batch_job_definition.this.*.revision, [""])[0]
}

#####
# IAM for EventBridge
#####

output "service_policy_id" {
  description = "The policy's ID."
  value       = concat(aws_iam_policy.service_role.*.id, [""])[0]
}

output "service_policy_arn" {
  description = "The ARN assigned by AWS to this policy."
  value       = concat(aws_iam_policy.service_role.*.arn, [""])[0]
}

output "service_policy_description" {
  description = "The description of the policy."
  value       = concat(aws_iam_policy.service_role.*.description, [""])[0]
}

output "service_policy_name" {
  description = "The name of the policy."
  value       = concat(aws_iam_policy.service_role.*.name, [""])[0]
}

output "service_policy_path" {
  description = "The path of the policy in IAM."
  value       = concat(aws_iam_policy.service_role.*.path, [""])[0]
}

output "service_policy_policy" {
  description = "The policy document."
  value       = concat(aws_iam_policy.service_role.*.policy, [""])[0]
}

output "service_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = concat(aws_iam_role.service_role.*.arn, [""])[0]
}

output "service_role_create_date" {
  description = "The creation date of the IAM role."
  value       = concat(aws_iam_role.service_role.*.create_date, [""])[0]
}

output "service_role_description" {
  description = "The description of the role."
  value       = concat(aws_iam_role.service_role.*.description, [""])[0]
}

output "service_role_id" {
  description = "The name of the role."
  value       = concat(aws_iam_role.service_role.*.id, [""])[0]
}

output "service_role_name" {
  description = "The name of the role."
  value       = concat(aws_iam_role.service_role.*.name, [""])[0]
}

output "service_role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = concat(aws_iam_role.service_role.*.unique_id, [""])[0]
}

#####
# EventBridge Rules
#####

output "rule_schedule_id" {
  description = "The name of the rule."
  value       = concat(aws_cloudwatch_event_rule.schedule.*.id, [""])[0]
}

output "rule_schedule_arn" {
  description = "The Amazon Resource Name (ARN) of the rule."
  value       = concat(aws_cloudwatch_event_rule.schedule.*.arn, [""])[0]
}

output "rule_event_id" {
  description = "The name of the rule."
  value       = concat(aws_cloudwatch_event_rule.schedule.*.id, [""])[0]
}

output "rule_event_arn" {
  description = "The Amazon Resource Name (ARN) of the rule."
  value       = concat(aws_cloudwatch_event_rule.schedule.*.arn, [""])[0]
}

output "target_schedule_arn" {
  description = "CloudWatch Event Target Arn."
  value       = concat(aws_cloudwatch_event_target.schedule.*.arn, [""])[0]
}

output "target_event_arn" {
  description = "CloudWatch Event Target Arn."
  value       = concat(aws_cloudwatch_event_target.schedule.*.arn, [""])[0]
}
