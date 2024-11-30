output "cloudfront_distribution_id" {
  description = "The ID of the distribution"
  value       = aws_cloudfront_distribution.this.id
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name corresponding to the distribution"
  value       = aws_cloudfront_distribution.this.domain_name
}
