#####
# Batch Job
#####

output "arn" {
  value = module.default.arn
}

output "revision" {
  value = module.default.revision
}


#####
# IAM for Batch Job
#####

output "execution_role_arn" {
  value = module.default.execution_role_arn
}

output "execution_role_create_date" {
  value = module.default.execution_role_create_date
}

output "execution_role_description" {
  value = module.default.execution_role_description
}

output "execution_role_id" {
  value = module.default.execution_role_id
}

output "execution_role_name" {
  value = module.default.execution_role_name
}

output "execution_role_unique_id" {
  value = module.default.execution_role_unique_id
}


#####
# IAM for EventBridge
#####

output "service_policy_id" {
  value = module.default.service_policy_id
}

output "service_policy_arn" {
  value = module.default.service_policy_arn
}

output "service_policy_description" {
  value = module.default.service_policy_description
}

output "service_policy_name" {
  value = module.default.service_policy_name
}

output "service_policy_path" {
  value = module.default.service_policy_path
}

output "service_policy_policy" {
  value = module.default.service_policy_policy
}

output "service_role_arn" {
  value = module.default.service_role_arn
}

output "service_role_create_date" {
  value = module.default.service_role_create_date
}

output "service_role_description" {
  value = module.default.service_role_description
}

output "service_role_id" {
  value = module.default.service_role_id
}

output "service_role_name" {
  value = module.default.service_role_name
}

output "service_role_unique_id" {
  value = module.default.service_role_unique_id
}


#####
# EventBridge Rules
#####

output "rule_schedule_id" {
  value = module.default.rule_schedule_id
}

output "rule_schedule_arn" {
  value = module.default.rule_schedule_arn
}

output "rule_event_id" {
  value = module.default.rule_event_id
}

output "rule_event_arn" {
  value = module.default.rule_event_arn
}

output "target_schedule_arn" {
  value = module.default.target_schedule_arn
}

output "target_event_arn" {
  value = module.default.target_event_arn
}
