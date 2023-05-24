resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = var.bucket_name

  rule {
    id     = "rule-01"
    status = "Enabled"
    expiration {
      days = 90
    }
  }

  rule {
    id     = "rule-02"
    status = "Enabled"
  }
}
