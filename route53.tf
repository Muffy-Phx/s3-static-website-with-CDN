resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

resource "aws_route53_record" "route53_records" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
output "name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}
