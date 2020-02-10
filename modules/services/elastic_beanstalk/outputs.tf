output "dns_url" {
	value = aws_elastic_beanstalk_environment.default.endpoint_url
	description = "Endpoint URL to connect app"
}