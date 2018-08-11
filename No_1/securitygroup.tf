resource "aws_security_group" "aws_sg_ec2" {
  vpc_id = "${aws_vpc.main.id}"
  name = "aws_sg_ec2"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"] 
      # use ip address here, allowing ssh from the world is not safe.
  } 
tags {
    Name = "aws_sg_ec2"
  }
}
