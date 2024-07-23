### Input Required ###
variable "environment" {
  description = "The environment where the resource is provisioned [dev/qa/staging/uat/prod]"
  default     = "dev"
}

variable "owner" {
  description = "The team responsible for the resource"
  default     = "platform"
}

variable "trusted_subnets" {
  description = "List of subnets allowed access to the EC2s via default security groups"
  default     = []
}
### Input Required End ###


# Standard Variables

locals {
  default_tags = {
    Billing     = var.owner
    CodeManaged = var.code_managed
    Compliance  = var.compliance
    Creator     = var.creator
    Environment = var.environment
    OneTime     = var.one_time
    Owner       = var.owner
  }
  domain = var.environment == "prod" ? "${var.owner}.${var.domain_parent}" : format("%s-%s", var.environment, "${var.owner}.${var.domain_parent}")
  name   = "ims-${var.owner}-${var.environment}"
}

variable "code_managed" {
  description = "Indicate the resource is managed by code [true/false]"
  default     = "true"
}

variable "compliance" {
  description = "Compliance requirements of the resource [phi/pii/none]"
  default     = "null"
}

variable "creator" {
  description = "The team created the resource"
  default     = "platform"
}

variable "domain_parent" {
  description = "The parent domain for the account"
  default     = "intelerad.com"
}



variable "one_time" {
  description = "Identify non-recurring or temporary expenses"
  default     = "null"
}