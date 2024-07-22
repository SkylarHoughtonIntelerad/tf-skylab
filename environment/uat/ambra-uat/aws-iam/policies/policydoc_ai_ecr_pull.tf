data "aws_iam_policy_document" "policydoc_ai_ecr_pull" {
  statement {
    actions = [
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
  }
  statement {
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:BatchGetImage",
      "ecr:GetLifecyclePolicy",
      "ecr:GetLifecyclePolicyPreview",
      "ecr:ListTagsForResource",
      "ecr:DescribeImageScanFindings"
    ]
    resources = [
      "arn:aws:ecr:us-east-2:004017024658:repository/ai-services-pytorch",
      "arn:aws:ecr:us-east-2:004017024658:repository/ai-services-pytorch/*",
      "arn:aws:ecr:us-east-2:004017024658:repository/ai-services-tensorflow",
      "arn:aws:ecr:us-east-2:004017024658:repository/ai-services-tensorflow/*"
    ]
  }
}
