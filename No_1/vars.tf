
variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = "map"
  default = {
       us-east-1 = "ami-ef151d90"
       us-west-2 = "ami-1cc69e64"
       us-west-1 = "ami-d8b05cbb"
  }
}
