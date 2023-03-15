resource "aws_route53_record" "a_record" {
  zone_id = var.HOSTED_ZONE
  name    = ""
  type    = "A"
  records = ["${aws_instance.ec2_instance.public_ip}"]
  ttl     = 60
}

resource "aws_route53_record" "www_alias" {
  zone_id = var.HOSTED_ZONE
  name    = "www"
  type    = "A"
  alias {
    name                   = aws_route53_record.a_record.fqdn
    zone_id                = aws_route53_record.a_record.zone_id
    evaluate_target_health = false
  }
}