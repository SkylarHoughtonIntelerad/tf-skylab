data "aws_iam_policy_document" "policydoc_cw_logs_to_s3" {
  statement {
    sid       = "AmazonSSMReadOnlyAccess"
    effect    = "Allow"
    resources = ["*"]
    actions = [
				"tag:Get*",
				"tag:Describe*",
				"ssm:Get*",
				"ssm:Put*",
				"s3:List*",
				"s3:GetBucketAcl",
				"s3:Get*",
				"s3:Put*",
				"logs:Create*",
				"logs:Describe*",
				"logs:List*",
    ]
  }
  statement {
    sid       = "AWSLambdaBasicExecutionRole"
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
  }

}
