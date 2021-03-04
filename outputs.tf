#####
# Batch Job
#####

output "arn" {
  value = concat(aws_batch_job_definition.this.*.arn, [""])[0]
}

output "revision" {
  value = concat(aws_batch_job_definition.this.*.revision, [""])[0]
}

#####
# IAM for Batch Job
#####

output "execution_role_arn" {
  value = concat(aws_iam_role.execution_role.*.arn, [""])[0]
}

output "execution_role_create_date" {
  value = concat(aws_iam_role.execution_role.*.create_date, [""])[0]
}

output "execution_role_description" {
  value = concat(aws_iam_role.execution_role.*.description, [""])[0]
}

output "execution_role_id" {
  value = concat(aws_iam_role.execution_role.*.id, [""])[0]
}

output "execution_role_name" {
  value = concat(aws_iam_role.execution_role.*.name, [""])[0]
}

output "execution_role_unique_id" {
  value = concat(aws_iam_role.execution_role.*.unique_id, [""])[0]
}

#####
# IAM for EventBridge
#####

output "service_policy_id" {
  value = concat(aws_iam_policy.service_role.*.id, [""])[0]
}

output "service_policy_arn" {
  value = concat(aws_iam_policy.service_role.*.arn, [""])[0]
}

output "service_policy_description" {
  value = concat(aws_iam_policy.service_role.*.description, [""])[0]
}

output "service_policy_name" {
  value = concat(aws_iam_policy.service_role.*.name, [""])[0]
}

output "service_policy_path" {
  value = concat(aws_iam_policy.service_role.*.path, [""])[0]
}

output "service_policy_policy" {
  value = concat(aws_iam_policy.service_role.*.policy, [""])[0]
}

output "service_role_arn" {
  value = concat(aws_iam_role.service_role.*.arn, [""])[0]
}

output "service_role_create_date" {
  value = concat(aws_iam_role.service_role.*.create_date, [""])[0]
}

output "service_role_description" {
  value = concat(aws_iam_role.service_role.*.description, [""])[0]
}

output "service_role_id" {
  value = concat(aws_iam_role.service_role.*.id, [""])[0]
}

output "service_role_name" {
  value = concat(aws_iam_role.service_role.*.name, [""])[0]
}

output "service_role_unique_id" {
  value = concat(aws_iam_role.service_role.*.unique_id, [""])[0]
}

#####
# EventBridge Rules
#####

output "rule_schedule_id" {
  value = concat(aws_cloudwatch_event_rule.schedule.*.id, [""])[0]
}

output "rule_schedule_arn" {
  value = concat(aws_cloudwatch_event_rule.schedule.*.arn, [""])[0]
}

output "rule_event_id" {
  value = concat(aws_cloudwatch_event_rule.schedule.*.id, [""])[0]
}

output "rule_event_arn" {
  value = concat(aws_cloudwatch_event_rule.schedule.*.arn, [""])[0]
}

output "target_schedule_arn" {
  value = concat(aws_cloudwatch_event_target.schedule.*.arn, [""])[0]
}

output "target_event_arn" {
  value = concat(aws_cloudwatch_event_target.schedule.*.arn, [""])[0]
}
