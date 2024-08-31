provider "aws" {
    region = "eu-west-1"
  
}

provider "aws" {
    region = "ap-south-1"
    alias = "mumb"
  
}
resource "aws_s3_bucket" "eubucket" {
    bucket = "simbueu"                         # it will be created in ireland region

}

resource "aws_s3_bucket" "mumbai" {
    bucket = "mumbsimbu"
   provider = aws.mumb           #aws.aliasname   it will be created im mumbai region
}