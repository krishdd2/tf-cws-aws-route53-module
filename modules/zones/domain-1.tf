# Tp create public hosted zone and subdomain zone for that 
resource "aws_route53_zone" "kk-main-domain" {
  name = "kk-shop-us-1.com"
}

resource "aws_route53_zone" "west-sub-domain" {
  name = "west.kk-shop-us-1.com"

  tags = {
    Environment = "dev"
  }
}