resource "aws_instance" "r2j" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = ["${aws_security_group.sg-r2j.name}"]

  tags = {
    "name" : "r2j"
  }
}