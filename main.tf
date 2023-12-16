provider "aws" {}

locals {
  tags = {
    Writer = "tvminh"
  }

  domain          = "tvminh.co"
  api_domain_name = "api.tvminh.co"
}

module "api_gateway" {
  source = "./modules/api-gateway"

  parent_path = "Card"
  actions = [
    {
      path_part = ""
      method    = "GET"
    },
    {
      path_part = ""
      method    = "POST"
    },
    {
      path_part = "Compress"
      method    = "POST"
    },
    {
      path_part = "GetList/{customerId}"
      method    = "GET"
    },
    {
      path_part = "{id}"
      method    = "GET"
    },
    {
      path_part = "{id}"
      method    = "DELETE"
    }
  ]

  acm_certificate_arn = module.dns.acm_certificate_arn
  domain_name         = local.domain
  api_domain_name     = local.api_domain_name

  tags = local.tags
}

module "dns" {
  source = "./modules/dns"

  domain               = local.domain
  cloudflare_api_token = var.cloudflare_api_token
  api_gateway_dns      = module.api_gateway.dns_name
}