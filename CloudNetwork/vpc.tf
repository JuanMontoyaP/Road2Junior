resource "aws_vpc" "vnet-nebo" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vnet-nebo"
  }
}

resource "aws_subnet" "snet-public" {
  vpc_id                  = aws_vpc.vnet-nebo.id
  cidr_block              = "10.0.0.0/17"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "snet-public"
  }
}

resource "aws_subnet" "snet-private" {
  vpc_id     = aws_vpc.vnet-nebo.id
  cidr_block = "10.0.128.0/17"

  tags = {
    Name = "snet-private"
  }
}