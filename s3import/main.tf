resource "aws_s3_bucket" "simbu" {
  bucket = "simbubompy"
}



# terraform import aws_s3_bucket.simbu simbubompy