resource "aws_s3_bucket" "new_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_lifecycle_configuration" "new_bucket_lifecycle" {
  bucket = aws_s3_bucket.new_bucket.id
  
  rule {
    status = var.lifecycle ? "ENABLED" : "DISABLED"

    filter {
      prefix = "expireds/"
    }
    transition {
      days = var.days
      storage_class = "DEEP_ARCHIVE"
    }
  }
  
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.new_bucket.id

  block_public_acls       = var.public_access
  ignore_public_acls      = var.public_access
  block_public_policy     = var.public_access
  restrict_public_buckets = var.public_access
}
