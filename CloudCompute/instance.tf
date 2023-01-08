resource "aws_instance" "r2j" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg-r2j.id]
  subnet_id              = aws_subnet.r2j-subnet.id
  monitoring             = true

  tags = {
    "Name" : "r2j"
  }
}