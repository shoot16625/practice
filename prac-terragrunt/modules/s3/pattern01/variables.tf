variable "bucket_name" {
  type = string
}

variable "bucket_lifecycle_rules" {
  type = list(object({
    id     = string
    status = string
    expiration = optional(object({
      days = number
    }))
  }))
  default = null
}
