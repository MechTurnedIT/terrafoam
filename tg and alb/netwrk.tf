# resource "aws_vpc" "myvpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "my-cust-vpc"
#   }


# }


# resource "aws_internet_gateway" "cust" {
#   vpc_id = aws_vpc.myvpc.id
#   tags = {
#     Name = "my_ig"
#   }
# }

# resource "aws_subnet" "public1" {
#   vpc_id            = aws_vpc.myvpc.id
#   cidr_block        = "10.0.0.0/24"
#   availability_zone = "eu-west-1a"
#   tags = {
#     Name = "pub_sub1"
#   }
# }

# resource "aws_subnet" "public2" {
#   vpc_id            = aws_vpc.myvpc.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "eu-west-1c"
#   tags = {
#     Name = "pub_sub2"
#   }
# }


# resource "aws_route_table" "custrt" {
#   vpc_id = aws_vpc.myvpc.id

#   route  {
#     gateway_id = aws_internet_gateway.cust.id
#     cidr_block = "0.0.0.0/0"
#   }
# }


# resource "aws_route_table_association" "cust1" {
#   route_table_id = aws_route_table.custrt.id
#   subnet_id =    aws_subnet.public1.id
# }

# resource "aws_route_table_association" "cust2" {
#   route_table_id = aws_route_table.custrt.id
#   subnet_id =    aws_subnet.public2.id
# }

# resource "aws_security_group" "custsg" {
#   name   = "allow"
#   vpc_id = aws_vpc.myvpc.id
#   tags = {
#     Name = "my_sg"
#   }
#   ingress {
#     description = "http"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]

#   }
#   ingress {
#     description = "https"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "TCP"
#     cidr_blocks = ["0.0.0.0/0"]

#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]

#   }


# }
