resource "aws_instance" "geek"{
    ami = "ami-0a2202cf4c36161a1"
    instance_type = "t2.micro"
    availability_zone = "eu-west-1c"
    key_name = "ireland"
    
  tags = {
    Name = "geek"
  }
}

resource "aws_s3_bucket" "test" {
  bucket = "bompy"
}

# terraform apply -target=aws_s3_bucket.test for bucket creation only
# terraform apply -target=aws_instance.geek   for ec2 creation only


# terraform destroy -target=aws_s3_bucket.test for bucket deletion only
# terraform destroy -target=aws_instance.geek   for ec2 deletion only