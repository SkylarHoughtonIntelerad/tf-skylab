module "account_vars" {
  source = "../account-vars"
}

module "local_policies" {
  source = "./policies"
}

module "common_policies" {
  source = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/common/policies?ref=master"
}

module "custom_policies" {
  source = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/iam-policy-doc?ref=master"

  for_each   = local.policies
  statements = each.value.statements
}

module "iam_role" {
  source = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/iam-role?ref=master"
  # source = "../../../../../pt-modules/aws/iam-role/"

  for_each           = local.roles
  assume_role_policy = each.value.assume_role_policy # data.aws_iam_policy_document.main[each.value.assume_role_policy].json
  managed_policies   = try(each.value.managed_policies, [])
  policies           = try(each.value.policies, null)
  tags               = merge(module.account_vars.default_tags, lookup(each.value, "tags", {}), { Name = each.key })
}

module "iam_instance_profile" {
  source = "git::ssh://git@github.com/dicomgrid/pt-modules.git//aws/iam-role?ref=master"
  # source = "../../../../../pt-modules/aws/iam-role/"

  instance_profile   = true
  for_each           = local.instance_profiles
  managed_policies   = try(each.value.managed_policies, [])
  policies           = try(each.value.policies, null)
  assume_role_policy = each.value.assume_role_policy
  tags               = merge(module.account_vars.default_tags, lookup(each.value, "tags", {}), { Name = each.key })
}

module "iam_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.30.2"

  for_each                                        = local.irsas
  attach_amazon_managed_service_prometheus_policy = try(each.value.attach_amazon_managed_service_prometheus_policy, false)
  attach_appmesh_controller_policy                = try(each.value.attach_appmesh_controller_policy, false)
  attach_aws_gateway_controller_policy            = try(each.value.attach_aws_gateway_controller_policy, false)
  attach_cert_manager_policy                      = try(each.value.attach_cert_manager_policy, false)
  attach_cluster_autoscaler_policy                = try(each.value.attach_cluster_autoscaler_policy, false)
  attach_ebs_csi_policy                           = try(each.value.attach_ebs_csi_policy, false)
  attach_efs_csi_policy                           = try(each.value.attach_efs_csi_policy, false)
  attach_external_dns_policy                      = try(each.value.attach_external_dns_policy, false)
  attach_external_secrets_policy                  = try(each.value.attach_external_secrets_policy, false)
  attach_fsx_lustre_csi_policy                    = try(each.value.attach_fsx_lustre_csi_policy, false)
  attach_karpenter_controller_policy              = try(each.value.attach_karpenter_controller_policy, false)
  attach_load_balancer_controller_policy          = try(each.value.attach_load_balancer_controller_policy, false)
  attach_node_termination_handler_policy          = try(each.value.attach_node_termination_handler_policy, false)
  attach_velero_policy                            = try(each.value.attach_velero_policy, false)
  attach_vpc_cni_policy                           = try(each.value.attach_vpc_cni_policy, false)
  cluster_autoscaler_cluster_names                = try(each.value.cluster_autoscaler_cluster_names, [])
  external_dns_hosted_zone_arns                   = try(each.value.external_dns_hosted_zone_arns, [])
  oidc_providers                                  = try(each.value.oidc_providers, {})
  role_name                                       = "${each.key}-irsa"
  tags                                            = merge(module.account_vars.default_tags, try(each.value.tags, {}), { Name = "${each.key}-irsa" })
  vpc_cni_enable_ipv4                             = try(each.value.vpc_cni_enable_ipv4, false)
}