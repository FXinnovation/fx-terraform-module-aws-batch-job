variable "tags" {
  description = "Map of tags that will be applied on all resources."
  type        = map(string)
  default     = {}
}

variable "prefix" {
  description = "Prefix to be added to with all resource's names of the module. Prefix is mainly used for tests and should remain empty in normal circumstances."
  type        = string
  default     = ""

  validation {
    condition     = can(regex("^[a-z0-9-]{0,16}$", var.prefix))
    error_message = "The var.prefix must match “^[a-z0-9-]{0,16}$”."
  }
}

variable "name" {
  description = "Name of your job, will be use by Job definition and EventBridge resources."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_-]{1,56}$", var.name))
    error_message = "The var.name must match “^[a-zA-Z0-9_-]{1,56}$”."
  }
}


#####
# Batch Job
#####

variable "job_create" {
  description = "Whether or not to create a job definition"
  type        = bool
  default     = true
}

variable "job_arn" {
  description = "When job_create == false, external job definition ARN"
  type        = string
  default     = null

  validation {
    condition     = var.job_arn == null ? true : can(regex("^arn:aws[a-zA-Z0-9-]*:batch:[a-zA-Z0-9-]+:[0-9]{12}:job-definition/[a-zA-Z0-9\\+=,\\.@_-]{1,64}:[0-9]*$", var.job_arn))
    error_message = "The var.job_arn must match ^arn:aws[a-zA-Z0-9-]*:batch:[a-zA-Z0-9-]+:[0-9]{12}:job-definition/[a-zA-Z0-9\\+=,\\.@_-]{1,64}:[0-9]*$."
  }
}

variable "properties" {
  description = "A valid container properties provided as a map (see an example here https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_definition / container_properties)."
  type        = any # fix merge error
}

variable "parameters" {
  description = "(Optional) Specifies the parameter substitution placeholders to set in the job definition."
  type        = map(string)
  default     = {}
}

variable "platform_capabilities" {
  description = "(Optional) The platform capabilities required by the job definition. If no value is specified, it defaults to EC2. To run the job on Fargate resources, specify FARGATE."
  type        = list(string)
  default     = null
}

variable "retries" {
  description = "The number of times to move a job to the RUNNABLE status. You may specify between 1 and 10 attempts."
  type        = number
  default     = 1

  validation {
    condition     = var.retries >= 1 && var.retries <= 10
    error_message = "The var.retries must be between 1 and 10."
  }
}

variable "job_tags" {
  description = "Map of tags that will be applied on job definition (merged on local.tags, var.tags)."
  type        = map(string)
  default     = {}
}

variable "timeout" {
  description = "(Optional) The time duration in seconds after which AWS Batch terminates your jobs if they have not finished. The minimum value for the timeout is 60 seconds."
  type        = number
  default     = null

  validation {
    condition     = var.timeout == null ? true : var.timeout >= 60
    error_message = "The var.timeout must be at least at 60 if not null."
  }
}


#####
# IAM for Batch Job
#####

variable "execution_role_create" {
  description = "Whether or not to create the IAM execution role."
  type        = bool
  default     = true
}

variable "execution_role_description" {
  description = "Description of the IAM role for executing task (var.name will be appended)."
  type        = string
  default     = "Execution role for tasks"

  validation {
    condition     = var.execution_role_description == null ? true : length(var.execution_role_description) <= 1000
    error_message = "The var.execution_role_description must be less than 1000 characters."
  }
}

variable "execution_role_path" {
  description = "Path in which to create the policy for executing task."
  type        = string
  default     = "/"

  validation {
    condition     = var.execution_role_path == null ? true : can(regex("^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$", var.execution_role_path))
    error_message = "The var.execution_role_path must match “^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$”."
  }
}


#####
# IAM for EventBridge
#####

variable "event_role_create" {
  description = "Whether or not to create IAM resources for EventBridge."
  type        = bool
  default     = true
}

variable "event_role_arn" {
  description = "When event_role_create == false, external Service Role ARN"
  type        = string
  default     = null

  validation {
    condition     = var.event_role_arn == null ? true : regex("^arn:aws[a-zA-Z0-9-]*:iam::[0-9]{12}:role/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$", var.event_role_arn)
    error_message = "The var.event_role_arn must match ^arn:aws[a-zA-Z0-9-]*:iam::[0-9]{12}:role/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$."
  }
}

variable "event_policy_name" {
  description = "Name of the policy (_var.name will be appended)."
  type        = string
  default     = "AWS_Events_Invoke_Batch_Job_Queue"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\+=,\\.@_-]{1,58}$", var.event_policy_name))
    error_message = "The var.event_policy_name must match ^[a-zA-Z0-9\\+=,\\.@_-]{1,58}$."
  }
}

variable "event_policy_description" {
  description = "Description of the IAM policy (var.name will be appended)."
  type        = string
  default     = "Service Role for EventBridge / Batch Job"

  validation {
    condition     = var.event_policy_description == null ? true : length(var.event_policy_description) <= 1000
    error_message = "The var.event_policy_description must be less than 1000 characters."
  }
}

variable "event_role_name" {
  description = "Name of the role (_var.name will be appended)."
  type        = string
  default     = "AWS_Events_Invoke_Batch_Job_Queue"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\+=,\\.@_-]{1,58}$", var.event_role_name))
    error_message = "The var.event_role_name must match ^[a-zA-Z0-9\\+=,\\.@_-]{1,58}$."
  }
}

variable "event_role_description" {
  description = "Description of the IAM role (var.name will be appended)."
  type        = string
  default     = "Service Role for EventBridge / Batch Job"

  validation {
    condition     = var.event_role_description == null ? true : length(var.event_role_description) <= 1000
    error_message = "The var.event_role_description must be less than 1000 characters."
  }
}

variable "event_role_path" {
  description = "Path in which to create the policy."
  type        = string
  default     = "/service-role/"

  validation {
    condition     = var.event_role_path == null ? true : can(regex("^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$", var.event_role_path))
    error_message = "The var.event_role_path must match “^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$”."
  }
}

variable "execution_role_tags" {
  description = "Map of tags that will be applied on IAM resources for execution role (merged on local.tags, var.tags)."
  type        = map(string)
  default     = {}
}

variable "execution_role_extras_policies" {
  description = "Extra policies ARN to attach to the execution role"
  type        = list(string)
  default     = []

  validation {
    condition     = var.execution_role_extras_policies != null ? can([for s in var.execution_role_extras_policies : regex("^arn:aws[a-zA-Z0-9-]*:iam::[0-9]{12}:policy/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$", s)]) : true
    error_message = "The var.execution_role_extras_policies must match ^arn:aws:iam[a-zA-Z0-9-]*::[0-9]{12}:policy/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$ if not null."
  }
}


#####
# EventBridge Rules
#####

variable "event_rules_create" {
  description = "Whether or not to create a EventBridge rule"
  type        = bool
  default     = true
}

variable "job_queue_arn" {
  description = "External Batch Job Queue ARN"
  type        = string

  validation {
    condition     = var.job_queue_arn == null ? true : can(regex("^arn:aws[a-zA-Z0-9-]*:batch:[a-zA-Z0-9-]+:[0-9]{12}:job-queue/[a-zA-Z0-9_-]{1,128}$", var.job_queue_arn))
    error_message = "The var.job_queue_arn must match ^arn:aws[a-zA-Z0-9-]*:batch:[a-zA-Z0-9-]+:[0-9]{12}:job-queue/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$."
  }
}

variable "event_rule_target_id" {
  description = "The unique target assignment ID. Will be prefixed with var.prefix and sufixed by -onsched/onevent."
  type        = string
  default     = "batchjob"

  validation {
    condition     = var.event_rule_target_id == null ? true : can(regex("^[a-zA-Z0-9\\._-]{1,51}$", var.event_rule_target_id))
    error_message = "The var.event_rule_target_id must match ^[a-zA-Z0-9\\._-]{1,51}$."
  }
}

variable "event_rules_name" {
  description = "Rule name (will be prefixed with 'var.prefix-job-' and sufixed with '-onsched/onevent'). If null, the rule will use var.name"
  type        = string
  default     = null

  validation {
    condition     = var.event_rules_name == null ? true : can(regex("^[a-zA-Z0-9\\._-]{1,47}$", var.event_rules_name))
    error_message = "The var.event_rules_name must match ^[a-zA-Z0-9\\._-]{1,47}$ if not null."
  }
}

variable "event_rules_description" {
  description = "The description of the rule."
  type        = string
  default     = "Run batch job based on event or schedule"

  validation {
    condition     = var.event_rules_description == null ? true : length(var.event_rules_description) <= 512
    error_message = "The var.event_rules_description must be less than 512 characters."
  }
}

variable "event_rules_is_enabled" {
  description = "Whether or not to enable EventBridge Rule"
  type        = bool
  default     = true
}

variable "event_rules_bus_name" {
  description = "The event bus to associate with this rule. If you omit this, the default event bus is used."
  type        = string
  default     = null

  validation {
    condition     = var.event_rules_bus_name == null ? true : can(regex("^[a-zA-Z0-9\\._-]{0,256}$", var.event_rules_bus_name))
    error_message = "The var.event_rules_bus_name must match ^[a-zA-Z0-9\\._-]{0,256}$."
  }
}

variable "schedule_expression" {
  description = "The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule_expression or event_pattern is required. Can only be used on the default event bus."
  type        = string
  default     = null

  validation {
    condition     = var.schedule_expression == null ? true : can(regex("^(cron|rate)\\(.*\\)$", var.schedule_expression))
    error_message = "The var.schedule_expression must match ^(cron|rate)\\(.*\\)$."
  }
}

variable "event_pattern" {
  description = "The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required. See full documentation of Events and Event Patterns in EventBridge for details."
  type        = string
  default     = null
}

variable "event_rules_role" {
  description = "The Amazon Resource Name (ARN) associated with the role that is used for target invocation."
  type        = string
  default     = null

  validation {
    condition     = var.event_rules_role == null ? true : can(regex("^arn:aws[a-zA-Z0-9-]*:iam::[0-9]{12}:role/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$", var.event_rules_role))
    error_message = "The var.event_rules_role must match ^arn:aws:iam[a-zA-Z0-9-]*::[0-9]{12}:role/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$."
  }
}

variable "event_tags" {
  description = "Map of tags that will be applied on EventBridge and IAM resources (merged on local.tags, var.tags)."
  type        = map(string)
  default     = {}
}
