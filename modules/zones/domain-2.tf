# Tp create public hosted zone and subdomain zone for that
resource "aws_route53_zone" "kk-main-domain-2" {
  name = "kk-shop-2-us.com"
}

resource "aws_route53_zone" "east-sub-domain" {
  name = "east.kk-shop-2-us.com"

  tags = {
    Environment = "dev"
  }
}

# To crate A record for kk-main-domain-2 zone
resource "aws_route53_record" "http" {
  zone_id = aws_route53_zone.kk-main-domain-2.zone_id
  name    = "www.kk-shop-2-us.com"
  type    = "A"
  ttl     = 300
  records = ["10.0.0.200"]
}
# To crate A record for east.kk-shop-2-us.com zone
resource "aws_route53_record" "newyork" {
  zone_id = aws_route53_zone.east-sub-domain.zone_id
  name    = "newyork.east.kk-shop-2-us.com"
  type    = "A"
  ttl     = 300
  records = ["10.0.0.201"]
}

# To crate A record for east.kk-shop-2-us.com zone
resource "aws_route53_record" "chicago" {
  zone_id = aws_route53_zone.east-sub-domain.zone_id
  name    = "chicago.east.kk-shop-2-us.com"
  type    = "A"
  ttl     = 300
  records = ["10.0.0.301"]
}



