provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  alias   = "use1"
  region  = "us-east-1"
  profile = "intelerad-root-acct"

  assume_role {
    role_arn     = "arn:aws:iam::993263853844:role/cross_account_admin"
    session_name = "ims-platform-admin"
    external_id  = "ims-platform"
  }
}

provider "aws" {
  alias   = "use2"
  region  = "us-east-2"
  profile = "intelerad-root-acct"
  assume_role {
    role_arn     = "arn:aws:iam::993263853844:role/cross_account_admin"
    session_name = "ims-platform-admin"
    external_id  = "ims-platform"
  }
}

provider "aws" {
  alias   = "usw1"
  region  = "us-west-1"
  profile = "intelerad-root-acct"
  assume_role {
    role_arn     = "arn:aws:iam::993263853844:role/cross_account_admin"
    session_name = "ims-platform-admin"
    external_id  = "ims-platform"
  }
}

provider "aws" {
  alias   = "usw2"
  region  = "us-west-2"
  profile = "intelerad-root-acct"
  assume_role {
    role_arn     = "arn:aws:iam::993263853844:role/cross_account_admin"
    session_name = "ims-platform-admin"
    external_id  = "ims-platform"
  }
}

provider "aws" {
  alias   = "cac1"
  region  = "ca-central-1"
  profile = "intelerad-root-acct"
  assume_role {
    role_arn     = "arn:aws:iam::993263853844:role/cross_account_admin"
    session_name = "ims-platform-admin"
    external_id  = "ims-platform"
  }
}
