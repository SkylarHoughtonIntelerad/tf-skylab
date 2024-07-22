data "aws_iam_policy_document" "policydoc_slackbot" {
  statement {
    sid       = "AmazonSSMReadOnlyAccess"
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "ec2:Describe*",
      "ec2:List*",
      "ec2:Get*",
      "ssm:Describe*",
      "ssm:Get*",
      "ssm:List*",
      "tag:Get*",
      "tag:Describe*",
      "iam:List*",
      "resource-groups:List*",
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
