resource "aws_instance" "us_server" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  
  # the user data
  user_data = "${file("cloud-config.yml")}"

  # the public address
  associate_public_ip_address = true

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.aws_sg_ec2.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.pfkeypair.key_name}"

  # the root block device

  root_block_device {
    volume_size = 10
  }

}
