output "dns_endpoint" {
  value = "${aws_instance.us_server.public_dns}"
}
