resource "aws_instance" "test" {
    ami = "ami-0a2202cf4c36161a1"
    instance_type = "t2.micro"
    availability_zone = "eu-west-1c"
    key_name = "ireland"
    count = length(var.test) #it will print 3
    
  tags = {
    #Name = "dev-1"
    #Name = "web-${count.index}"     # will create ec2 with name web-0,web-1 as per count given
    Name= var.test[count.index]
  }
}

variable "test" {
    type = list(string)
    default = [ "dev","test","prod"]
  
}