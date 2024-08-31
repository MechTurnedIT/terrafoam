provider "aws" {
    profile = "default"

}

provider "aws" {
    profile = "account2"
    alias = "account2"
    
  
}

resource "aws_s3_bucket" "name" {
    bucket = "act2-bucket"
    provider = aws.account2         #it willl be created in aws configured account2
  
}

resource "aws_s3_bucket" "test" {
    bucket = "default-act-bucket"      
                                   #it will be created in default account
  
}

