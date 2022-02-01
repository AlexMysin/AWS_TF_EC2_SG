resource "aws_instance" "myservername" {
  ami           = "ami-055d15d9cfddf7bd3" # ubuntu server 20.04 LTS
  instance_type = "t2.micro"
  security_groups = [aws_security_group.MyTfEC2group.name]
  key_name = "Tf_key"
  tags = {
    "Name" = "Myserver"
    "number" = "first"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.myservername.id
  vpc      = true
}