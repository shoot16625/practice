resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  count = var.bucket_lifecycle_rules != null ? 1 : 0

  bucket = aws_s3_bucket.this.id
  dynamic "rule" {
    for_each = var.bucket_lifecycle_rules
    content {
      id     = rule.value.id
      status = rule.value.status

      dynamic "expiration" {
        for_each = rule.value.expiration != null ? [rule.value.expiration] : []
        content {
          days = expiration.value.days
        }
      }
    }
  }
}
