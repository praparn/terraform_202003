resource "aws_s3_bucket" "labbucket" {
  bucket = "labresource-bucket-student-X"
  acl    = "public-read-write"
  depends_on = [aws_instance.labserver1, aws_instance.labserver2]
  tags = {
    Environment = "rd"
    Region      = "ap-southeast-1"
    AZ          = "none"
    Categories  = "storage"
    Name        = "labresource-bucket-student-X"
    Zone        = "public"
    Module      = "s3"
    Billing     = "terraform-workshop"
  }
}

output "aws_s3_labbucket_id" {
  value = aws_s3_bucket.labbucket.id
}

output "aws_s3_labbucket_arn" {
  value = aws_s3_bucket.labbucket.arn
}

output "aws_s3_labbucket_domainname" {
  value = aws_s3_bucket.labbucket.bucket_domain_name
}

output "aws_s3_labbucket_websitedomain" {
  value = aws_s3_bucket.labbucket.website_domain
}

output "aws_s3_labbucket_website_endpoint" {
  value = aws_s3_bucket.labbucket.website_endpoint
}
