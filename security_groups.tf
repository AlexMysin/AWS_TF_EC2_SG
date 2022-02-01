resource "aws_security_group" "MyTfEC2group" {
  name        = "MyTfEC2group"
  description = "Allow ssh + web inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description      = "Inbound rule SSL/TLS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
 cidr_blocks      = ["103.21.244.0/22","103.22.200.0/22","103.31.4.0/22","104.16.0.0/13","104.24.0.0/14","108.162.192.0/18","131.0.72.0/22","141.101.64.0/18","162.158.0.0/15","172.64.0.0/13","173.245.48.0/20","188.114.96.0/20","190.93.240.0/20","197.234.240.0/22","198.41.128.0/17"]
    ipv6_cidr_blocks = ["2400:cb00::/32","2606:4700::/32","2803:f800::/32","2405:b500::/32","2405:8100::/32","2a06:98c0::/29","2c0f:f248::/32"]
  }

ingress {
    description      = "Inbound rule Web"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["103.21.244.0/22","103.22.200.0/22","103.31.4.0/22","104.16.0.0/13","104.24.0.0/14","108.162.192.0/18","131.0.72.0/22","141.101.64.0/18","162.158.0.0/15","172.64.0.0/13","173.245.48.0/20","188.114.96.0/20","190.93.240.0/20","197.234.240.0/22","198.41.128.0/17"]
    ipv6_cidr_blocks = ["2400:cb00::/32","2606:4700::/32","2803:f800::/32","2405:b500::/32","2405:8100::/32","2a06:98c0::/29","2c0f:f248::/32"]
  }


ingress {
    description      = "Inbound rule SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["5.166.91.11/32"]
 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "MyTfEC2group"
    instance_name = "myservername"
  }
}