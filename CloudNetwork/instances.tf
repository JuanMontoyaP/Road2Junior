# Private instance
resource "aws_instance" "vm1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.nebo-sg.id]
  subnet_id              = aws_subnet.snet-private.id
  monitoring             = true

  tags = {
    "Name" = "vm1"
  }
}

# Public instance
resource "aws_instance" "vm2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.nebo-sg.id]
  subnet_id              = aws_subnet.snet-public.id
  monitoring             = true

  tags = {
    "Name" = "vm2"
  }
}