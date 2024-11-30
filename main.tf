locals {
  id = "${var.org_name}-${var.region_name}-${var.environment}-${var.project_name}-${var.resource_desc}"
}

resource "aws_cloudfront_distribution" "this" {
  comment             = var.cloudfront_distribution_config.comment
  default_root_object = var.cloudfront_distribution_config.default_root_object
  enabled             = var.cloudfront_distribution_config.enabled
  http_version        = var.cloudfront_distribution_config.http_version
  is_ipv6_enabled     = var.cloudfront_distribution_config.is_ipv6_enabled
  price_class         = var.cloudfront_distribution_config.price_class
  retain_on_delete    = var.cloudfront_distribution_config.retain_on_delete
  staging             = var.cloudfront_distribution_config.staging
  wait_for_deployment = var.cloudfront_distribution_config.wait_for_deployment
  #web_acl_id          = var.cloudfront_distribution_config.web_acl_id

  origin {
    domain_name = var.origin_configuration.domain_name
    origin_id   = var.origin_configuration.origin_id
    #origin_path = var.origin_configuration.origin_path

    custom_origin_config {
      http_port                = var.origin_configuration.http_port
      https_port               = var.origin_configuration.https_port
      origin_keepalive_timeout = var.origin_configuration.origin_keepalive_timeout
      origin_protocol_policy   = var.origin_configuration.origin_protocol_policy
      origin_read_timeout      = var.origin_configuration.origin_read_timeout
      origin_ssl_protocols     = var.origin_configuration.origin_ssl_protocols
    }
  }

  # Define default cache behavior
  default_cache_behavior {
    target_origin_id       = var.origin_configuration.origin_id # Ensure this matches the origin_id in the origin block
    viewer_protocol_policy = var.default_cache_behavior.viewer_protocol_policy
    allowed_methods        = var.default_cache_behavior.allowed_methods
    cached_methods         = var.default_cache_behavior.cached_methods
    compress               = var.default_cache_behavior.compress
    default_ttl            = var.default_cache_behavior.default_ttl
    max_ttl                = var.default_cache_behavior.max_ttl
    min_ttl                = var.default_cache_behavior.min_ttl

    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }

      headers = ["Origin"]
    }
  }

  dynamic "custom_error_response" {
    for_each = var.custom_error_responses
    content {
      error_code            = custom_error_response.value.error_code
      response_page_path    = custom_error_response.value.response_page_path
      response_code         = custom_error_response.value.response_code
      error_caching_min_ttl = custom_error_response.value.error_caching_min_ttl
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = merge({ Name = local.id }, var.default_tags)

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
