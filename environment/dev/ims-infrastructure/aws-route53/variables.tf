# Inputs
locals {
  delegation_sets = {
      "${module.account_vars.domain}" = {}
    }

  private_zones = {
    "${module.account_vars.domain}" = {
      records = {
        test = {
          destinations = ["192.168.1.1"]
        }
      }
    }
  }

  public_zones = {
    "${module.account_vars.domain}" = {
      # delegation_set = "${module.account_vars.domain}"
    }
  }
}

# Dynamic
locals {
  vpc_ids = concat(data.aws_vpcs.use2.ids)
  
  zones = merge(
    { for z,zval in local.private_zones : "${z}-private" =>
      {
        name = z
        records = { for r,rval in zval.records : "${r}.${z}" => {
          destinations = rval.destinations
          ttl = lookup(rval, "ttl", 300)
          type = lookup(rval, "type", "A")
        }}
        tags = merge({ZoneType = "private"}, lookup(zval, "tags", {}))
        vpc_ids = lookup(zval, "vpc_ids", local.vpc_ids)
      } if length(local.vpc_ids) > 0
    },
    { for z,zval in local.public_zones: "${z}-public" =>
      {
        name = z
        records = lookup(zval, "records", {})
        tags = merge({ZoneType = "public"}, lookup(zval, "tags", {}))
        delegation_set_id = module.route53_delegation_set[lookup(zval, "delegation_set", module.account_vars.domain)].output.id
      }
    }
  )
}