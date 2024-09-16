terraform {
  backend "s3" {
    bucket         = "euprimary-terraform-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}
