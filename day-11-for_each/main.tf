resource "aws_instance" "test" {
    ami = "ami-0a2202cf4c36161a1"
    instance_type = "t2.micro"
    availability_zone = "eu-west-1c"
    key_name = "ireland"
    for_each = toset(var.test)
    
  tags = {
    #Name = "dev-1"
    Name = each.value
    
  }
}

variable "test" {
    type = list(string)
    default = [ "dev","test","prod"]
  
}