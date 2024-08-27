data "aws_subnet" "dev" {
  filter {
    name = "tag:Name"
    values = [ "sub" ]
  }
}


resource "aws_instance" "geek"{
    ami = "ami-0a2202cf4c36161a1"
    instance_type = "t2.micro"
     key_name = "ireland"
     subnet_id = data.aws_subnet.dev.id
    
  tags = {
    Name = "geek"
  }
}