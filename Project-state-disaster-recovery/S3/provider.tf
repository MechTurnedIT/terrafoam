provider "aws" {
  region = "eu-west-1"
  alias  = "euwest"
}


provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 5.59.0"
#     }
#   }
# }
