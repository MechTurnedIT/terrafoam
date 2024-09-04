resource "aws_instance" "geek"{
    ami = "ami-0a2202cf4c36161a1"
    instance_type = "t2.medium"
    availability_zone = "eu-west-1c"
    key_name = "ireland"
    user_data              = templatefile("./install.sh", {})
    
  tags = {
    Name = "jengeek"
  }
}
