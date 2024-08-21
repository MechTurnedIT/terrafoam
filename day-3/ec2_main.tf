resource "aws_instance" "devpub" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public.id
  associate_public_ip_address = true
  vpc_security_group_ids = [ aws_security_group.custsg.id ]
  tags = {
    name = "ec2pub"
  }
}

resource "aws_instance" "devpvt" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.custsg.id]
  tags = {
    name = "ec2pvt"
  }
}