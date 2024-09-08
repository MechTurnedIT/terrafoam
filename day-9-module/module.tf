#--------------module for existing folder in local use------------- 


module "dev" {
  source = "../day-3-custom-network"
  ami           = "ami-0a2202cf4c36161a1"
  instance_type = "t2.micro"
  key_name      = "ireland"

}
