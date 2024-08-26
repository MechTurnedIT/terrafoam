#-------------------to configure state file in backend s3 bucket-----------------


terraform {
  backend "s3" {
    bucket = "bompy"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }
}