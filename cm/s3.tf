resource "aws_s3_bucket" "mi222" {
  bucket = "222commission.org"

  tags = {
    Lightsail   = "222ProdBucket"
  }
}
resource "aws_s3_bucket" "www-mi222" {
  bucket = "www.222commission.org"

  tags = {
    Lightsail   = "222ProdBucket"
  }
}

# Website Configuration
resource "aws_s3_bucket_website_configuration" "website-config" {
  bucket = aws_s3_bucket.mi222.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_website_configuration" "www-website-config" {
  bucket = aws_s3_bucket.www-mi222.bucket

  redirect_all_requests_to {
		protocol = "https"
		host_name = aws_cloudfront_distribution.s3_distribution.domain_name
	} 
}

# Public Access Setting
resource "aws_s3_bucket_public_access_block" "mi222-public" {
  bucket = aws_s3_bucket.mi222.bucket

  block_public_acls   = true
  block_public_policy = true
}
resource "aws_s3_bucket_public_access_block" "www-mi222-public" {
  bucket = aws_s3_bucket.www-mi222.bucket

  block_public_acls   = true
  block_public_policy = true
}

# Bucket Policy
resource "aws_s3_bucket_policy" "bucket_object_access_policy" {
	bucket = aws_s3_bucket.mi222.id
	policy = data.aws_iam_policy_document.bucket_object_access_policy.json
}

data "aws_iam_policy_document" "bucket_object_access_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      aws_s3_bucket.mi222.arn,
      "${aws_s3_bucket.mi222.arn}/*"
    ]
  }
}

# Upload Files
resource "aws_s3_object" "files" {
	for_each = fileset("public/", "**")
	bucket = aws_s3_bucket.mi222.bucket
	# content_type = "text/html"
	content_type = lookup(local.mimes_types, regex("[^\\.]+$", each.value), null)
	key = each.value
	source = "public/${each.value}"
	etag= filemd5("public/${each.value}")
}

locals {
	mimes_types = {
		html = "text/html"
		css = "text/css"
		jpg = "image/jpeg"
		js = "text/js"
	}
}
