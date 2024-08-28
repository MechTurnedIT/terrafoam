module "dev" {
  source = "github.com/MechTurnedIT/terraform//day-2-All.tf-files"
  ami           = "ami-0a2202cf4c36161a1"
  instance_type = "t2.micro"
  key_name      = "ireland"
}