#####
# Batch Job
#####

output "arn" {
  value = concat(module.disabled.*.arn, [""])[0]
}

output "revision" {
  value = concat(module.disabled.*.revision, [""])[0]
}

#####
# IAM for EventBridge
#####

output "service_policy_id" {
  value = concat(module.disabled.*.service_policy_id, [""])[0]
}

output "service_policy_arn" {
  value = concat(module.disabled.*.service_policy_arn, [""])[0]
}

output "service_policy_description" {
  value = concat(module.disabled.*.service_policy_description, [""])[0]
}

output "service_policy_name" {
  value = concat(module.disabled.*.service_policy_name, [""])[0]
}

output "service_policy_path" {
  value = concat(module.disabled.*.service_policy_path, [""])[0]
}

output "service_policy_policy" {
  value = concat(module.disabled.*.service_policy_policy, [""])[0]
}

output "service_role_arn" {
  value = concat(module.disabled.*.service_role_arn, [""])[0]
}

output "service_role_create_date" {
  value = concat(module.disabled.*.service_role_create_date, [""])[0]
}

output "service_role_description" {
  value = concat(module.disabled.*.service_role_description, [""])[0]
}

output "service_role_id" {
  value = concat(module.disabled.*.service_role_id, [""])[0]
}

output "service_role_name" {
  value = concat(module.disabled.*.service_role_name, [""])[0]
}

output "service_role_unique_id" {
  value = concat(module.disabled.*.service_role_unique_id, [""])[0]
}

#####
# EventBridge Rules
#####

output "rule_schedule_id" {
  value = concat(module.disabled.*.rule_schedule_id, [""])[0]
}

output "rule_schedule_arn" {
  value = concat(module.disabled.*.rule_schedule_arn, [""])[0]
}

output "rule_event_id" {
  value = concat(module.disabled.*.rule_event_id, [""])[0]
}

output "rule_event_arn" {
  value = concat(module.disabled.*.rule_event_arn, [""])[0]
}

output "target_schedule_arn" {
  value = concat(module.disabled.*.target_schedule_arn, [""])[0]
}

output "target_event_arn" {
  value = concat(module.disabled.*.target_event_arn, [""])[0]
}
