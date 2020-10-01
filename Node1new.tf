provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "techbleatinfra"
    key = "tech.tfstate"
    region = "eu-west-2"
  }
}

resource "aws_instance" "node_one" {
  ami                    = "ami-080b750a46edafc2b"
  instance_type          = "t2.micro"
  key_name               = "DAY 2 HOMEWORK"
  vpc_security_group_ids = [aws_security_group.demo_security.id]

  tags = {
    Name        = "Tool Box"
    provisioner = "Terraform"
    test        = "yes_no"
  }
}

resource "aws_instance" "node_two" {
  ami                    = "ami-080b750a46edafc2b"
  instance_type          = "t2.micro"
  key_name               = "DAY 2 HOMEWORK"
  vpc_security_group_ids = [aws_security_group.demo_security.id]

  tags = {
    Name        = "Tool Box"
    provisioner = "Terraform"
  }
}

resource "aws_security_group" "demo_security" {
  name = "the_twonodes_security"

  ingress {
    from_port   = 80
    to_port     = 80
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