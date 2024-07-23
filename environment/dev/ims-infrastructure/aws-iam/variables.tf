locals {
  policies = {
    cross_account_default = {
      statements = [
        {
          sid = "AssumeRole"
          # effect = "Allow"
          principals = [
            {
              # type = "AWS"
              identifiers = ["arn:aws:iam::873031875931:root"] # Root account
            }
          ]
          actions = ["sts:AssumeRole"]
        }
      ]
    }
    assume_logging_role = {
      statements = [
        {
          sid    = "AssumeRole"
          effect = "Allow"
          principals = [
            {
              type        = "Service"
              identifiers = ["vpc-flow-logs.amazonaws.com"]
            }
          ]
          actions = ["sts:AssumeRole"]
        }
      ]
    }
    #terraform import 'module.iam_role["cloud-conformity"].aws_iam_role.main' cloud-conformity
    #terraform apply -target='module.iam_role["cloud-conformity"].aws_iam_role.main'
    cloud_conformity = {
      statements = [
        {
          sid     = ""
          actions = ["sts:AssumeRole"]
          principals = [
            {
              # type = "AWS"
              identifiers = ["arn:aws:iam::717210094962:root"] # Root account
            }
          ]
          condition = [
            {
              test     = "StringEquals",
              variable = "sts:ExternalId",
              values   = ["9ca0c9b0-9749-11e8-b1f2-8f81d9893215"],
            }
          ]
        }
      ]
    }
    lambda = {
      statements = [
        {
          sid     = "AllowLambda"
          actions = ["sts:AssumeRole"]
          principals = [
            {
              type        = "Service"
              identifiers = ["lambda.amazonaws.com"]
            }
          ]
        }
      ]
    }
  }

  roles = {
    cross_account_jenkins = {
      assume_role_policy = module.custom_policies["cross_account_default"].json
      policy             = module.common_policies.ims_developer
    }
    assume_logging_role = {
      assume_role_policy = module.custom_policies["assume_logging_role"].json
      policy             = module.common_policies.vpc-flow-role
    }
    cloud-conformity = {
      assume_role_policy = module.custom_policies.cloud_conformity.json
      policy             = module.common_policies.cloud-conformity
    }
    slackbot = {
      assume_role_policy = module.custom_policies["lambda"].json
      policy             = module.local_policies.policydoc_slackbot
    }
    cw_logs_to_s3 = {
      assume_role_policy = module.custom_policies["lambda"].json
      policy             = module.local_policies.policydoc_cw_logs_to_s3
    }
  }
  users = {}
}

