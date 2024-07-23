locals {
  defaults = {
    create                   = true
    tags                     = {}
    name                     = "assumeAWSrole"
    path                     = "/"
    permissions_boundary_arn = null
    description              = "My role for GitHub Actions"
    name_prefix              = null
    policies                 = {}
    force_detach_policies    = true
    max_session_duration     = 3600
    audience                 = "sts.amazonaws.com"
    subjects                 = []
    provider_url             = "token.actions.githubusercontent.com"
  }

  items = {
    my-role = {
      tags                     = {}
      name                     = "oidcrole"
      path                     = "/"
      description              = "GitHub Actions"
      name_prefix              = null
      policies = {
        "s3-read-only" = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
      }
      audience                 = "sts.amazonaws.com"
      subjects                 = [""]
      provider_url             = "token.actions.githubusercontent.com"
    }
  }
}
