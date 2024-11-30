variable "org_name" {
  description = "Organization name for the resource to provision"
  type        = string
  default     = null
}
variable "region_name" {
  description = "Region for AWS to be used in naming convention"
  type        = string
  default     = null
}
variable "environment" {
  description = "Environment details to be used in the naming convention"
  type        = string
  default     = null
}
variable "project_name" {
  description = "Project name to be used in the naming convention"
  type        = string
  default     = null
}
variable "resource_desc" {
  description = "Description of the resource"
  type        = string
  default     = null
}
variable "origin_name" {
  description = "The name of the origin"
  type        = string
  default     = null
}
variable "default_tags" {
  description = "Tags to be used with all the resources provisioned with this script"
  type        = map(string)
  default     = {}
}

variable "default_cache_behavior" {
  description = "A default cache behavior configuration"
  type = object({
    target_origin_id       = string
    viewer_protocol_policy = string
    allowed_methods        = list(string)
    cached_methods         = list(string)
    compress               = bool
    default_ttl            = number
    max_ttl                = number
    min_ttl                = number
  })
  default = {
    target_origin_id       = ""
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    default_ttl            = 3600
    max_ttl                = 86400
    min_ttl                = 0
  }
}

variable "custom_error_responses" {
  description = "A list of custom error response elements"
  type = list(object({
    error_code            = number
    response_page_path    = string
    response_code         = string
    error_caching_min_ttl = number
  }))
  default = []
}

# Define an object type variable for the origin configuration
variable "origin_configuration" {
  type = object({
    connection_attempts      = number
    connection_timeout       = number
    http_port                = number
    https_port               = number
    origin_keepalive_timeout = number
    origin_protocol_policy   = string
    origin_read_timeout      = number
    origin_ssl_protocols     = list(string)
    domain_name              = string
    origin_id                = string
    #origin_path              = string
    #enable_origin_shield     = bool
    enabled = bool
    #origin_shield_region     = string
  })
}

# Define an top-level variable for the CloudFront distribution configuration
variable "cloudfront_distribution_config" {
  type = object({
    comment             = string
    default_root_object = string
    enabled             = bool
    http_version        = string
    is_ipv6_enabled     = bool
    price_class         = string
    retain_on_delete    = bool
    staging             = bool
    wait_for_deployment = bool
    web_acl_id          = string
  })
}
