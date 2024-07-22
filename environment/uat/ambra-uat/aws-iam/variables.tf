variable "oidc_provider_arns" {
  default = {
    ambra-uat = "arn:aws:iam::150552228373:oidc-provider/oidc.eks.us-east-2.amazonaws.com/id/B02C59E636827D1DBDB1A89BEF6D9107"
  }
}

locals {
  irsas = {
    cluster-autoscaler = {
      attach_cluster_autoscaler_policy = true
      cluster_autoscaler_cluster_names = [
        "ambra-uat",
      ]
      oidc_providers = {
        ambra-uat = {
          provider_arn               = var.oidc_provider_arns["ambra-uat"]
          namespace_service_accounts = ["kube-system:cluster-autoscaler"]
        }
      }
    }
    efs-csi = {
      attach_efs_csi_policy = true
      oidc_providers = {
        ambra-uat-controller = {
          provider_arn               = var.oidc_provider_arns["ambra-uat"]
          namespace_service_accounts = ["kube-system:efs-csi-controller-sa"]
        }
        ambra-uat-node = {
          provider_arn               = var.oidc_provider_arns["ambra-uat"]
          namespace_service_accounts = ["kube-system:efs-csi-node-sa"]
        }
      }
    }
    load-balancer-controller = {
      attach_load_balancer_controller_policy = true
      oidc_providers = {
        ambra-uat = {
          provider_arn               = var.oidc_provider_arns["ambra-uat"]
          namespace_service_accounts = ["kube-system:aws-load-balancer-controller"]
        }
      }
    }
    vpc-cni-ipv4 = {
      attach_vpc_cni_policy = true
      vpc_cni_enable_ipv4   = true
      oidc_providers = {
        ambra-uat = {
          provider_arn               = var.oidc_provider_arns["ambra-uat"]
          namespace_service_accounts = ["kube-system:aws-node"]
        }
      }
    }
  }
  policies = {
    intelerad_cross_account_default = {
      statements = [
        {
          sid = "AssumeRole"

          principals = [
            {
              identifiers = ["arn:aws:iam::873031875931:root"] # Root account
            }
          ]
          actions = ["sts:AssumeRole"]
        },
      ]
    }
    intelerad_assume_ssm = {
      statements = [
        {
          sid = "AssumeRole"

          principals = [
            {
              identifiers = ["arn:aws:iam::873031875931:root"] # Root account
            }
          ]
          actions = ["sts:AssumeRole"]
        },
        {
          sid = "AssumeSSM"

          principals = [
            {
              type = "Service"
              identifiers = [
                "ssm.amazonaws.com",
                "ec2.amazonaws.com"
              ]
            }
          ]
          actions = ["sts:AssumeRole"]
        },
      ]
    }
    slackbot = {
      statements = [
        {
          sid     = "slackbot"
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
    ec2_assume_role = {
      statements = [
        {
          sid = "AssumeSSM"

          principals = [
            {
              type = "Service"
              identifiers = [
                "ssm.amazonaws.com",
                "ec2.amazonaws.com"
              ]
            }
          ]
          actions = ["sts:AssumeRole"]
        },
      ]
    }
  }
  roles = {
    cross_account_ssm_operator = {
      assume_role_policy = module.custom_policies["intelerad_assume_ssm"].json
      managed_policies   = [data.aws_iam_policy.ambra_prod_aoss_policy.arn]
      policies = {
        ssm_operator = module.local_policies.policydoc_ssm_operator
      }
    }
    cross_account_ssm_readonly = {
      assume_role_policy = module.custom_policies["intelerad_assume_ssm"].json
      policies = {
        ssm_readonly = module.local_policies.policydoc_ssm_readonly
      }
    }
    slackbot = {
      assume_role_policy = module.custom_policies["slackbot"].json
      policies = {
        slackbot = module.local_policies.policydoc_slackbot
      }
    }
  }
  instance_profiles = {
    cross_account_ssm_instance_profile = {
      assume_role_policy = module.custom_policies["intelerad_assume_ssm"].json
      managed_policies   = [data.aws_iam_policy.ambra_prod_aoss_policy.arn]
      policies = {
        ssm_instance_profile = module.local_policies.policydoc_ssm_instance_profile
      }
    }
    ai_ecr_pull = {
      assume_role_policy = module.custom_policies["ec2_assume_role"].json
      managed_policies   = [data.aws_iam_policy.ambra_prod_aoss_policy.arn]
      policies = {
        ssm_instance_profile = module.local_policies.policydoc_ssm_instance_profile
        ai_ecr_pull          = module.local_policies.policydoc_ai_ecr_pull
      }
    }
  }
}
