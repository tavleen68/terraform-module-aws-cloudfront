## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudfront_distribution_config"></a> [cloudfront\_distribution\_config](#input\_cloudfront\_distribution\_config) | Define an top-level variable for the CloudFront distribution configuration | <pre>object({<br>    comment             = string<br>    default_root_object = string<br>    enabled             = bool<br>    http_version        = string<br>    is_ipv6_enabled     = bool<br>    price_class         = string<br>    retain_on_delete    = bool<br>    staging             = bool<br>    wait_for_deployment = bool<br>    web_acl_id          = string<br>  })</pre> | n/a | yes |
| <a name="input_custom_error_responses"></a> [custom\_error\_responses](#input\_custom\_error\_responses) | A list of custom error response elements | <pre>list(object({<br>    error_code            = number<br>    response_page_path    = string<br>    response_code         = string<br>    error_caching_min_ttl = number<br>  }))</pre> | `[]` | no |
| <a name="input_default_cache_behavior"></a> [default\_cache\_behavior](#input\_default\_cache\_behavior) | A default cache behavior configuration | <pre>object({<br>    target_origin_id       = string<br>    viewer_protocol_policy = string<br>    allowed_methods        = list(string)<br>    cached_methods         = list(string)<br>    compress               = bool<br>    default_ttl            = number<br>    max_ttl                = number<br>    min_ttl                = number<br>  })</pre> | <pre>{<br>  "allowed_methods": [<br>    "GET",<br>    "HEAD"<br>  ],<br>  "cached_methods": [<br>    "GET",<br>    "HEAD"<br>  ],<br>  "compress": true,<br>  "default_ttl": 3600,<br>  "max_ttl": 86400,<br>  "min_ttl": 0,<br>  "target_origin_id": "",<br>  "viewer_protocol_policy": "redirect-to-https"<br>}</pre> | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Tags to be used with all the resources provisioned with this script | `map(string)` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment details to be used in the naming convention | `string` | `null` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Organization name for the resource to provision | `string` | `null` | no |
| <a name="input_origin_configuration"></a> [origin\_configuration](#input\_origin\_configuration) | Define an object type variable for the origin configuration | <pre>object({<br>    connection_attempts      = number<br>    connection_timeout       = number<br>    http_port                = number<br>    https_port               = number<br>    origin_keepalive_timeout = number<br>    origin_protocol_policy   = string<br>    origin_read_timeout      = number<br>    origin_ssl_protocols     = list(string)<br>    domain_name              = string<br>    origin_id                = string<br>    #origin_path              = string<br>    #enable_origin_shield     = bool<br>    enabled                  = bool<br>    #origin_shield_region     = string<br>  })</pre> | n/a | yes |
| <a name="input_origin_name"></a> [origin\_name](#input\_origin\_name) | The name of the origin | `string` | `null` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name to be used in the naming convention | `string` | `null` | no |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Region for AWS to be used in naming convention | `string` | `null` | no |
| <a name="input_resource_desc"></a> [resource\_desc](#input\_resource\_desc) | Description of the resource | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_distribution_domain_name"></a> [cloudfront\_distribution\_domain\_name](#output\_cloudfront\_distribution\_domain\_name) | The domain name corresponding to the distribution |
| <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id) | The ID of the distribution |
