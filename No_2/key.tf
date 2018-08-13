resource "aws_key_pair" "pfkeypair" {
  key_name = "pfkeypair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
