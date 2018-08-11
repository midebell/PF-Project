resource "aws_launch_configuration" "us_server-launchconfig" {
  name_prefix          = "us_server-launchconfig"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t2.micro"
  key_name             = "${aws_key_pair.pfkeypair.key_name}"
  security_groups      = ["${aws_security_group.aws_sg_ec2.id}"]
}

resource "aws_autoscaling_group" "us_server-autoscaling" {
  name                 = "us_server-autoscaling"
  vpc_zone_identifier  = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]
  launch_configuration = "${aws_launch_configuration.us_server-launchconfig.name}"
  min_size             = 1
  max_size             = 2
  health_check_grace_period = 300
  health_check_type = "EC2"
  force_delete = true

  tag {
      key = "Name"
      value = "ec2 instance"
      propagate_at_launch = true
  }
}