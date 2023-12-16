variable "tags" {
  description = "Tags"
  type        = any
  default     = {}
}

variable "actions" {
  description = "API paths"
  type = list(object({
    path_part = string
    method    = string
  }))
}

variable "parent_path" {
  description = "Parent path"
  type        = string
}

variable "domain_name" {
  description = "Custom Domain Name"
  type        = string
}

variable "api_domain_name" {
  description = "API Gateway Domain Name"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ACM Certification ARN"
  type        = string
}