variable "dns_zone" {
  default = "dev.pt.intelerad.com"
}

variable "eks_api_allowed_cidrs" {
  default = ["172.16.192.0/18"]
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "tags" {
  default = {
    Environment = "dev"
  }
}

locals {
  subnet_cidrs = [ for v in data.aws_subnet.main : v.cidr_block ]
  subnet_ids   = [ for v in data.aws_subnet.main : v.id ]
  mount_targets = { for k,v in data.aws_subnet.main : v.availability_zone => { subnet_id = v.id } }
  
  tags = merge(
    var.tags,
    {
      Cluster = var.cluster_name
    }
  )
}