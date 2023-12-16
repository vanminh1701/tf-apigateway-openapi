terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.20"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

locals {

  # Removing trailing dot from domain - just to be sure :)
  domain_name = trimsuffix(var.domain, ".")
}

data "cloudflare_zone" "this" {
  name = local.domain_name
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = local.domain_name
  zone_id     = data.cloudflare_zone.this.id

  subject_alternative_names = [
    "*.${local.domain_name}"
  ]

  create_route53_records  = false
  validation_method       = "DNS"
  validation_record_fqdns = cloudflare_record.validation[*].hostname

  tags = {
    Name = local.domain_name
  }
}

resource "cloudflare_record" "validation" {
  count = length(module.acm.distinct_domain_names)

  zone_id = data.cloudflare_zone.this.id
  name    = element(module.acm.validation_domains, count.index)["resource_record_name"]
  type    = element(module.acm.validation_domains, count.index)["resource_record_type"]
  value   = trimsuffix(element(module.acm.validation_domains, count.index)["resource_record_value"], ".")
  ttl     = 60
  proxied = false

  allow_overwrite = true
}

resource "cloudflare_record" "api_gateway" {
  zone_id         = data.cloudflare_zone.this.id
  name            = "api"
  value           = var.api_gateway_dns
  type            = "CNAME"
  proxied         = false
  ttl             = 300
  allow_overwrite = true
}