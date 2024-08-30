#example with numeric condition in this condition if ec2 instance = t2.micro only instance will create(count = var.instance_type == "t2.micro" ? 1 : 0) but i am passing t2.nano so ec2 will not create
#variables.tf
variable "ami" {
  type    = string
  default = "ami-0a2202cf4c36161a1"
}

variable "instance_type" {
  type = string
  default = "t2.nano"
}

# main.tf
resource "aws_instance" "dev" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = var.instance_type == "t2.micro" ? 1 : 0
  key_name = "ireland"
  tags = {
    Name = "dev_server"
  }
}


# If var.instance_type is "t2.micro", then count will be 1, and the aws_instance resource will be created.
# If var.instance_type is anything other than "t2.micro", then count will be 0, and the aws_instance resource will not be created.