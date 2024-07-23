variable "cluster_name" { default = "plt-test-eks" }
variable "cluster_version" { default = "1.26" }
variable "vpc_id" { default = "vpc-04d7e22454efae807" }
# variable "subnet_ids" { default = ["subnet-006330f91375d113e", "subnet-0819ff61677c225a6", "subnet-05af4226d2e26eee7"] }
# variable "subnet_azs" { default = ["us-east-2a", "us-east-2b", "us-east-2c"] }
variable "subnet_names" { default = ["platform-dev-pri-ext-use2a-1", "platform-dev-pri-ext-use2b-1", "platform-dev-pri-ext-use2c-1"] }

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"
  providers = {
    aws = aws.use2
  }

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id                         = var.vpc_id
  subnet_ids                     = local.subnet_ids
  cluster_endpoint_public_access = false
  # enable_irsa                    = true

  cluster_addons = {
    coredns = {
      preserve    = true
      most_recent = true

      timeouts = {
        create = "25m"
        delete = "10m"
      }
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    ng1 = {
      name = "${var.cluster_name}-mng1"

      instance_types = ["m5.large"]

      min_size     = 3
      max_size     = 6
      desired_size = 3
    }
  }

  # Extend cluster security group rules
  cluster_security_group_additional_rules = {
    ingress_source_security_group_id = {
      description              = "EKS Cluster Private API Access"
      protocol                 = "tcp"
      from_port                = 443
      to_port                  = 443
      type                     = "ingress"
      cidr_blocks = var.eks_api_allowed_cidrs
    }
  }

  # # Extend node-to-node security group rules
  # node_security_group_additional_rules = {
  #   ingress_self_all = {
  #     description = "Node to node all ports/protocols"
  #     protocol    = "-1"
  #     from_port   = 0
  #     to_port     = 0
  #     type        = "ingress"
  #     self        = true
  #   }
  #   # Test: https://github.com/terraform-aws-modules/terraform-aws-eks/pull/2319
  #   ingress_source_security_group_id = {
  #     description              = "Ingress from another computed security group"
  #     protocol                 = "tcp"
  #     from_port                = 22
  #     to_port                  = 22
  #     type                     = "ingress"
  #     source_security_group_id = aws_security_group.additional.id
  #   }
  # }

  # aws-auth configmap
  # create_aws_auth_configmap = true
  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::959946720450:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_organization-cloud-admin_00c3c6857ad6ffb7"
      username = "platform"
      groups   = ["system:masters"]
    },
    {
        rolearn  = "arn:aws:iam::816424257650:role/cross_account_admin"
        username = "platform"
        groups   = ["system:masters"]
    },
  ]

  tags = merge(var.tags, { Name = "${var.cluster_name}"})
}

### CNI ###
module "vpc_cni_ipv4_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.28.0"

  role_name             = "${var.cluster_name}-vpc-cni-ipv4-irsa"
  attach_vpc_cni_policy = true
  vpc_cni_enable_ipv4   = true

  oidc_providers = {
    one = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:aws-node"]
    }
  }

  tags = merge(var.tags, { Name = "${var.cluster_name}-vpc-cni-ipv4-irsa"})
}

### Ingress Controller ###
module "load_balancer_controller_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.28.0"

  role_name                              = "${var.cluster_name}-load-balancer-controller-irsa"
  attach_load_balancer_controller_policy = true

  oidc_providers = {
    one = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:aws-load-balancer-controller"]
    }
  }

  tags = merge(var.tags, { Name = "${var.cluster_name}-load-balancer-controller-irsa"})
}

module "external_dns_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.28.0"

  role_name                     = "${var.cluster_name}-external-dns-irsa"
  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = ["arn:aws:route53:::hostedzone/Z088685221RW4JITTODNL"]

  oidc_providers = {
    one = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:external-dns"]
    }
  }

  tags = merge(var.tags, { Name = "${var.cluster_name}-external-dns-irsa"})
}


### EFS ###
module "efs_csi_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.28.0"

  role_name             = "${var.cluster_name}-efs-csi-irsa"
  attach_efs_csi_policy = true

  oidc_providers = {
    one = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:efs-csi-controller-sa"]
    }
  }
  tags = merge(var.tags, { Name = "${var.cluster_name}-efs-csi-irsa"})
}

module "efs" {
  source  = "terraform-aws-modules/efs/aws"
  version = "1.2.0"

  name           = "${var.cluster_name}-fs"
  # creation_token = "example-token"
  encrypted      = true
  # kms_key_arn    = "arn:aws:kms:eu-west-1:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"

  # performance_mode                = "maxIO" # Default is generalPurpose. Valid values: generalPurpose or maxIO. 
  # throughput_mode                 = "provisioned" # Defaults to bursting. Valid values: bursting, elastic, and provisioned. When using provisioned, also set provisioned_throughput_in_mibps
  # provisioned_throughput_in_mibps = 256 # Only for "provisioned" throughput_mode

  # lifecycle_policy = {
  #   transition_to_ia = "AFTER_30_DAYS"
  # }

  # File system policy
  # attach_policy                      = false
  # bypass_policy_lockout_safety_check = false
  # policy_statements = [
  #   {
  #     sid     = "Example"
  #     actions = ["elasticfilesystem:ClientMount"]
  #     principals = [
  #       {
  #         type        = "AWS"
  #         identifiers = ["arn:aws:iam::111122223333:role/EfsReadOnly"]
  #       }
  #     ]
  #   }
  # ]

  # Mount targets / security group
  mount_targets = local.mount_targets
  security_group_description = "${var.cluster_name} EFS security group"
  security_group_vpc_id      = var.vpc_id
  security_group_rules = {
    vpc = {
      # relying on the defaults provdied for EFS/NFS (2049/TCP + ingress)
      description = "NFS ingress from VPC private subnets"
      cidr_blocks = local.subnet_cidrs
    }
  }

  # Access point(s)
  # access_points = {
  #   "${var.cluster_name}-efs-ap" = {
  #     jenkins_directory = {
  #       path = "/jenkins"
  #       creation_info = {
  #         owner_gid   = 1000
  #         owner_uid   = 1000
  #         permissions = "777"
  #       }
  #     }
  #     tags = var.tags
  #   }
  # }

  # Backup policy
  enable_backup_policy = false

  # Replication configuration
  # create_replication_configuration = false
  # replication_configuration_destination = {
  #   region = "us-west-2"
  # }

  tags = merge(var.tags, { Name = "${var.cluster_name}-fs"})
}

# Temp; need to make standalone r53 record module

data "aws_route53_zone" "main" {
  name         = var.dns_zone
  # private_zone = true
}

resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.cluster_name}.${var.dns_zone}"
  type    = "CNAME"
  ttl     = 300
  records = [trimprefix(module.eks.cluster_endpoint, "https://")]
}