resource "aws_s3_bucket" "bucket" {
    bucket = "simbubompy"
}

resource "aws_s3_bucket_versioning" "version" {
    bucket = aws_s3_bucket.bucket.id
    versioning_configuration {
      status = "Enabled"
    }
  
}