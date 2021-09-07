data "aws_vpc" "this" {
  default = true
}

data "aws_subnet_ids" "this" {
  vpc_id = data.aws_vpc.this.id
}

data "aws_iam_policy_document" "extra_policy" {
  statement {
    sid = "1"

    effect = "Allow"

    actions = ["s3:*"]

    resources = [
      "arn:aws:s3:::toto",
      "arn:aws:s3:::toto/*",
    ]
  }
}
