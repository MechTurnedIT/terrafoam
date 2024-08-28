data "aws_vpc" "custvpc" {
  id = "vpc-017763ccc560eb33a"
}

data "aws_subnet" "sub1" {
  id = "subnet-009e1bc0e16e88a6c"
}

data "aws_subnet" "sub2" {
  id = "subnet-0220212bf95070aa8"
}

data "aws_security_group" "sg" {
  id = "sg-02211ed6fad4384b9"
}