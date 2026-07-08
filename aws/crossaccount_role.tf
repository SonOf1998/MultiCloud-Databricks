resource "aws_iam_policy" "cross_account_policy" {
  name   = "${local.prefix}-crossaccount-iam-policy"
  policy = data.databricks_aws_crossaccount_policy.this.json
}

data "databricks_aws_assume_role_policy" "this" {
  external_id = var.databricks_account_id
}

resource "aws_iam_role" "cross_account" {
  name               = "${local.prefix}-crossaccount-iam-role"
  assume_role_policy = data.databricks_aws_assume_role_policy.this.json
  description        = "Grants Databricks full access to VPC resources"
}

resource "aws_iam_role_policy_attachment" "cross_account" {
  policy_arn = aws_iam_policy.cross_account_policy.arn
  role       = aws_iam_role.cross_account.name
}