provider "aws" {
  region = "us-east-2"
  assume_role {
    role_arn     = "arn:aws:iam::150552228373:role/cross_account_admin"
    session_name = "sre-inf-terraform-admin"
    external_id  = "sre-inf-terraform"
  }
}

provider "aws" {
  alias  = "root"
  region = "us-east-1"
}

provider "aws" {
  alias  = "use1"
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::150552228373:role/cross_account_admin"
    session_name = "sre-inf-terraform-admin"
    external_id  = "sre-inf-terraform"
  }
}

provider "aws" {
  alias  = "use2"
  region = "us-east-2"
  assume_role {
    role_arn     = "arn:aws:iam::150552228373:role/cross_account_admin"
    session_name = "sre-inf-terraform-admin"
    external_id  = "sre-inf-terraform"
  }
}

provider "aws" {
  alias  = "usw1"
  region = "us-west-1"
  assume_role {
    role_arn     = "arn:aws:iam::150552228373:role/cross_account_admin"
    session_name = "sre-inf-terraform-admin"
    external_id  = "sre-inf-terraform"
  }
}

provider "aws" {
  alias  = "usw2"
  region = "us-west-2"
  assume_role {
    role_arn     = "arn:aws:iam::150552228373:role/cross_account_admin"
    session_name = "sre-inf-terraform-admin"
    external_id  = "sre-inf-terraform"
  }
}

provider "aws" {
  alias  = "cac1"
  region = "ca-central-1"
  assume_role {
    role_arn     = "arn:aws:iam::150552228373:role/cross_account_admin"
    session_name = "sre-inf-terraform-admin"
    external_id  = "sre-inf-terraform"
  }
}
