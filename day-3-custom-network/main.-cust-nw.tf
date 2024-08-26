####################### custom network creation  ################

#vpc creation

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-cust-vpc"
  }

}

# internet gateway creation

resource "aws_internet_gateway" "cust" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "my_ig"
  }
}

# create subnet

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = "pub_sub"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = "eu-west-1b"
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name = "pvt_sub"
  }
}

# create route table and ig attachment

resource "aws_route_table" "custrt" {
  vpc_id = aws_vpc.myvpc.id

  route  {
    gateway_id = aws_internet_gateway.cust.id
    cidr_block = "0.0.0.0/0"
  }
}

#   subnet association

resource "aws_route_table_association" "cust" {
  route_table_id = aws_route_table.custrt.id
  subnet_id      = aws_subnet.public.id
}

#    create elastic ip for nat gateway

resource "aws_eip" "elastic" {
  
}

#     creating nat gateway

resource "aws_nat_gateway" "natg" {
   subnet_id = aws_subnet.public.id
   connectivity_type = "public"
   allocation_id = aws_eip.elastic.id
   tags = {
     Name= "natgway"
   }
}


#    creating private route table and edit route
   
   resource "aws_route_table" "pvtrt" {
     vpc_id = aws_vpc.myvpc.id
     tags = {
       Name="pvtrt"
     }
     route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.natg.id
     }
   }

#    attaching pvt rt to pvt subnet

   resource "aws_route_table_association" "pvtassociation" {
     route_table_id = aws_route_table.pvtrt.id
     subnet_id = aws_subnet.private.id
   }


#     create security group

resource "aws_security_group" "custsg" {
  name   = "allow"
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "my_sg"
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }


}

