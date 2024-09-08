resource "aws_instance" "test"{
    ami = "ami-0a2202cf4c36161a1"
    instance_type = "t2.micro"
    availability_zone = "eu-west-1c"
    key_name = "ireland"
    
  tags = {
    Name = "test"
  }
}

resource "null_resource" "remote" {
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y"
    
    ]

    connection {
      type     = "ssh"
      host     = aws_instance.test.public_ip
      user     = "ec2-user"
      private_key = file("~/downloads/ireland.pem")
    }
  }

  depends_on = [aws_instance.test]
}
