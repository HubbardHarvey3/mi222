resource "aws_acm_certificate" "cert" {
	domain_name = "222commission.org"

	tags = {
		"Lightsail" = "222TLSCert"
	}
}