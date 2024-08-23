terraform {
  backend "s3" {
    bucket = "simbubompy"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }
}