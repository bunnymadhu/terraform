## sg means = security group

resource "aws_instance" "sample" {
  ami                                    = "ami-059e6ca6474628ef0"
  instance_type                     = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
}

provider "aws" {
  region                               = "us-east-1"
}

output "public_ip" {
  value = aws_instance.sample.public_ip
}

## aws security group terraform search in chrome and opn first info u cn find this

resource "aws_security_group" "allow_ssh" {
  name          = "allow_ssh"
  description  = "Allow TLS inbound traffic"

  ingress {
    description             = "SSH"
    from_port               = 22
    to_port                   = 22
    protocol                 = "tcp"
    cidr_blocks            = ["0.0.0.0/0"]
  }

  egress {
    from_port              = 0
    to_port                  = 0
    protocol                = "-1"
    cidr_blocks           = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  tags = {
    Name = "allow_ssh "
  }
}

## even though if you create one new  instance in  aws,and create another one and in that  one changes manually  security group id and  give terraform-apply it can overwrites the older secrity group id..terraform automatucally overwrites the id....