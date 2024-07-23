data "aws_eks_cluster_auth" "default" {
  provider = aws.use2
  name = module.eks.cluster_name
}

data "aws_subnet" "main" {
  for_each = toset(var.subnet_names)
  filter {
    name   = "tag:Name"
    values = [each.value]
  }
}
