#####
# Datasources
#####

data "aws_iam_policy_document" "events_batch" {
  statement {
    sid    = "EventsBatch1"
    effect = "Allow"

    actions = ["batch:SubmitJob"]

    resources = [
      var.job_queue_arn,
      var.job_create ? aws_batch_job_definition.this.0.arn : var.job_arn
    ]
  }
}

data "aws_iam_policy_document" "events_assume" {
  statement {
    sid    = "EventsAssume1"
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}
