resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = var.acm_validation_method

  tags = {
    Name=var.team_name
    Email=var.email
  }

  lifecycle {
    create_before_destroy = true
  }
}


