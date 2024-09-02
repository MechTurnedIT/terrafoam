resource "aws_instance" "geek"{
    ami = "ami-0a2202cf4c36161a1"
    instance_type = "t2.micro"
    availability_zone = "eu-west-1c"
    key_name = "ireland"
    
  tags = {
    Name = "geek"
  }
}

# terraform workspace ----different workspaces creates diffrent statefiles associated to them 
#     delete    Delete a workspace
#     list      List Workspaces
#     new       Create a new workspace
#     select    Select a workspace
#     show      Show the name of the current workspace