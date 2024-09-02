locals {
  region = "eu-west-1"
  environment = "dev"
  instance_type = "t2.micro"
}

resource "aws_instance" "example" {
  ami           = "ami-0a2202cf4c36161a1" # Amazon Linux 2 AMI
  instance_type = local.instance_type

  tags = {
    Name        = "ExampleInstance"
    Environment = local.environment
  }
}

