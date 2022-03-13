resource "aws_route53_zone" "mi222" {
  name = "222commission.org"

	tags = {
    Lightsail   = "222ProdBucket"
  }
}

resource "aws_route53_record" "primary" {
  zone_id = aws_route53_zone.mi222.zone_id
  name    = "222commission.org"
  type    = "A"
  alias {
		name =  aws_cloudfront_distribution.s3_distribution.domain_name
		zone_id = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
		evaluate_target_health = false
	}
}
resource "aws_route53_record" "secondary" {
  zone_id = aws_route53_zone.mi222.zone_id
  name    = "www.222commission.org"
  type    = "A"
  alias {
		name =  aws_cloudfront_distribution.s3_distribution.domain_name
		zone_id = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
		evaluate_target_health = false
	}
}