resource "aws_instance" "dev" {
    ami = "ami-04e49d62cf88738f1"
    instance_type = "t2.micro"
    key_name = "ireland"
    tags = {
      Name = "terraform"
    }
}

#command terraform import aws_instance.dev i-0a76bf77ad987a324