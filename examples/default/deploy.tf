resource "random_string" "prefix" {
  length  = 4
  special = false
  upper   = false
  number  = false
}

locals {
  tags = {
    Env    = "Test"
    Prefix = random_string.prefix.result
  }
}

resource "aws_iam_policy" "extra_policy" {
  name        = format("%sExtraPolicy", random_string.prefix.result)
  description = "extra policy"
  path        = "/"
  policy      = data.aws_iam_policy_document.extra_policy.json
}

module "compute_environment" {
  source = "github.com/FXinnovation/fx-terraform-module-aws-batch.git?ref=1.0.0"

  prefix = format("tft%s-", random_string.prefix.result)

  compute_resource_subnet_ids          = data.aws_subnet_ids.this.ids
  service_linked_role_spot_create      = false
  service_linked_role_spotfleet_create = false
  tags                                 = local.tags
}

module "default" {
  source = "../../"

  prefix = format("tft%s-", random_string.prefix.result)

  name                           = "batchjob"
  job_queue_arn                  = module.compute_environment.batch_job_queue_this_arn
  execution_role_extras_policies = [aws_iam_policy.extra_policy.arn]
  schedule_expression            = "cron(0 0 * * ? 1970)"
  properties = {
    "image" : "busybox",
    "command" : ["ls", "-la"],
    "memory" : 256,
    "vcpus" : 1,
  }

  tags = local.tags
}
