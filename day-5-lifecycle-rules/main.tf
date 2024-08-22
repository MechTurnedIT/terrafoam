resource "aws_instance" "geek"{
    ami = "ami-0a2202cf4c36161a1"
    instance_type = "t2.micro"
    availability_zone = "eu-west-1c"
    key_name = "ireland"
    
  tags = {
    Name = "geek"
  }

#below examples are for lifecycle meta_arguments 

#   lifecycle {
#     create_before_destroy = true    #this attribute will create the new object first and then destroy the old one
#   }

# lifecycle {
#  prevent_destroy = true   #Terraform will error when it attempts to destroy a resource when this is set to true:
# }


#   lifecycle {
#   ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.
#   }
}
