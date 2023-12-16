output "arn" {
  value = aws_api_gateway_rest_api.api_gateway.arn
}

output "dns_name" {
  value = aws_api_gateway_domain_name.domain.regional_domain_name
}