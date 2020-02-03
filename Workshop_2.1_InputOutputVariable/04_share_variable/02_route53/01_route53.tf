resource "aws_route53_record" "lab_route53" {
  for_each = var.aws_instance_labserver_ip
  zone_id = var.zone_id
  name    = each.key
  type    = "A"
  ttl     = "30"
  records = [each.value]
}
output "aws_route53_fqdn" {
  value = {
    for dns in aws_route53_record.lab_route53:
    dns.name => dns.fqdn
  }
}