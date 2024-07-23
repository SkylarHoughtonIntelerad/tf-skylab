# Get list of all vpcs in region
data "aws_vpcs" "use2" {
  provider = aws.use2
}