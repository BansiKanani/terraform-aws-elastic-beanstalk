output "bucket_id" {
	value = aws_s3_bucket.default.id
}
output "bucket_domain_name" {
	value = aws_s3_bucket.default.bucket_domain_name
}
output "object_id" {
	value = aws_s3_bucket_object.default.id
}
output "object_version" {
	value = aws_s3_bucket_object.default.version_id
}