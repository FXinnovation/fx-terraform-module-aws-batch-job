locals {
  tags = {
    managed-by = "Terraform"
  }
}


#####
# Batch Job
#####

resource "aws_batch_job_definition" "this" {
  count = var.job_create ? 1 : 0

  name = format("%s%s", var.prefix, var.name)
  type = "container"

  container_properties = jsonencode(merge(
    var.execution_role_create ? { "jobRoleArn" : aws_iam_role.execution_role.0.arn } : {},
    var.properties,
  ))

  parameters = var.parameters

  retry_strategy {
    attempts = var.retries
  }

  dynamic "timeout" {
    for_each = var.timeout != null ? [""] : []
    content {
      attempt_duration_seconds = var.timeout
    }
  }

  tags = merge(
    local.tags,
    var.tags,
    var.job_tags,
  )
}


#####
# IAM for Batch Job
#####

resource "aws_iam_role" "execution_role" {
  count = var.execution_role_create ? 1 : 0

  name               = format("%s%s-ExecutionRole", var.prefix, var.name)
  description        = format("%s (%s)", var.execution_role_description, var.name)
  path               = var.execution_role_path
  assume_role_policy = data.aws_iam_policy_document.tasks_assume.*.json[0]

  tags = merge(
    local.tags,
    var.tags,
    var.execution_role_tags,
  )
}

resource "aws_iam_role_policy_attachment" "execution_role_extras_policies" {
  count = var.execution_role_create ? length(var.execution_role_extras_policies) : 0

  role       = aws_iam_role.execution_role.0.name
  policy_arn = var.execution_role_extras_policies[count.index]
}


#####
# IAM for EventBridge
#####

resource "aws_iam_policy" "service_role" {
  count = var.event_role_create ? 1 : 0

  name        = format("%s%s_%s", var.prefix, var.event_policy_name, var.name)
  description = format("%s (%s)", var.event_policy_description, var.name)
  path        = var.event_role_path
  policy      = data.aws_iam_policy_document.events_batch.json
}

resource "aws_iam_role" "service_role" {
  count = var.event_role_create ? 1 : 0

  name               = format("%s%s_%s", var.prefix, var.event_role_name, var.name)
  description        = format("%s (%s)", var.event_role_description, var.name)
  path               = var.event_role_path
  assume_role_policy = data.aws_iam_policy_document.events_assume.*.json[0]

  tags = merge(
    local.tags,
    var.tags,
    var.event_tags,
  )
}

resource "aws_iam_role_policy_attachment" "service_role" {
  count = var.event_role_create ? 1 : 0

  role       = aws_iam_role.service_role.0.name
  policy_arn = aws_iam_policy.service_role.0.arn
}


#####
# EventBridge Rules
#####

resource "aws_cloudwatch_event_rule" "schedule" {
  count = (var.event_rules_create && var.schedule_expression != null) ? 1 : 0

  name        = format("%sjob-%s-onsched", var.prefix, var.event_rules_name != null ? var.event_rules_name : var.name)
  description = var.event_rules_description
  is_enabled  = var.event_rules_is_enabled

  event_bus_name      = var.event_rules_bus_name
  schedule_expression = var.schedule_expression
  role_arn            = var.event_rules_role

  tags = merge(
    local.tags,
    var.tags,
    var.event_tags,
  )
}

resource "aws_cloudwatch_event_rule" "event" {
  count = (var.event_rules_create && var.event_pattern != null) ? 1 : 0

  name        = format("%s%s-onevent", var.prefix, var.event_rules_name != null ? var.event_rules_name : var.name)
  description = var.event_rules_description
  is_enabled  = var.event_rules_is_enabled

  event_bus_name = var.event_rules_bus_name
  event_pattern  = var.event_pattern
  role_arn       = var.event_rules_role

  tags = merge(
    local.tags,
    var.tags,
    var.event_tags,
  )
}

resource "aws_cloudwatch_event_target" "schedule" {
  count = (var.event_rules_create && var.schedule_expression != null) ? 1 : 0

  target_id = format("%s%s-onsched", var.prefix, var.event_rule_target_id)

  rule     = aws_cloudwatch_event_rule.schedule.0.name
  arn      = var.job_queue_arn
  role_arn = var.event_role_create ? aws_iam_role.service_role.0.arn : var.event_role_arn
  batch_target {
    job_name       = format("%s%s", var.prefix, var.name)
    job_definition = var.job_create ? aws_batch_job_definition.this.0.id : var.job_arn
  }
}

resource "aws_cloudwatch_event_target" "event" {
  count = (var.event_rules_create && var.event_pattern != null) ? 1 : 0

  target_id = format("%s%s-onevent", var.prefix, var.event_rule_target_id)

  rule     = aws_cloudwatch_event_rule.event.0.name
  arn      = var.job_queue_arn
  role_arn = var.event_role_create ? aws_iam_role.service_role.0.arn : var.event_role_arn
  batch_target {
    job_name       = format("%s%s", var.prefix, var.name)
    job_definition = var.job_create ? aws_batch_job_definition.this.0.id : var.job_arn
  }
}
