resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
  bucket = "terraform-devops-${var.environment}-${random_id.bucket_suffix.hex}"

  tags = {
    Name = "Terraform DevOps Bucket"
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}