resource "aws_instance" "geek"{
    ami = "ami-0a2202cf4c36161a1"
    instance_type = "t2.micro"
    availability_zone = "eu-west-1c"
    key_name = "ireland"
    
  tags = {
    Name = "geek2"
  }
}



#if terraform.tfstate file got corrupted...we can use  terraform.tfstate.backup file  as state file with previous data. rename this file as terraform.tfstate