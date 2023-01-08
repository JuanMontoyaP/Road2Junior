resource "aws_vpc" "r2j-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "r2j-vpc"
  }
}

resource "aws_subnet" "r2j-subnet" {
  vpc_id     = aws_vpc.r2j-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name : "r2j-private-subnet"
  }
}