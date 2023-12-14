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
  type = string
}