resource "aws_s3_bucket" "default" {
	bucket = var.bucket_name
}
resource "aws_s3_bucket_object" "default" {
	bucket = aws_s3_bucket.default.id
	key = var.key_name
	source = var.source_file
}