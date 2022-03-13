resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
	comment = "222commission.org"	
}

locals {
	s3_origin_id = "222commission.org.s3.us-east-1.amazonaws.com"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
	origin {
		domain_name = aws_s3_bucket.mi222.bucket_regional_domain_name
		origin_id = local.s3_origin_id
		s3_origin_config {
			origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
		}
	}

	aliases = ["www.222commission.org", "222commission.org"]

	price_class = "PriceClass_100"

	viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.cert.arn
		ssl_support_method = "sni-only"
  }
	enabled = true
	default_root_object = "index.html"
	default_cache_behavior {
		allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

		forwarded_values {
			query_string = false
			cookies {
				forward = "none"
			}
		}
		viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
	}
	restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GT", "MX"]
    }
  }
	  tags = {
    Lightsail   = "222ProdBucket"
  }

}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}

