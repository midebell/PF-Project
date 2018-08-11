provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "frankfurt" {
  ami                         = "ami-c7e0c82c"
  instance_type               = "t2.micro"
  user_data                   = "${file("cloud-config.yml")}"
  security_groups             = ["${aws_security_group.main.id}"]
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.main.id}"

  root_block_device {
    volume_size = 10
  }
}

resource "aws_security_group" "main" {
  name   = "aws_sg_ec2"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/20"

  tags {
    Name = "Main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "main"
  }
}

resource "aws_route" "route" {
  route_table_id         = "${aws_vpc.main.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}

output "dns_endpoint" {
  value = "${aws_instance.frankfurt.public_dns}"
}
