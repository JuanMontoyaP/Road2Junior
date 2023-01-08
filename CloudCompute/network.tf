resource "aws_internet_gateway" "r2j-gateway" {
  vpc_id = aws_vpc.r2j-vpc.id

  tags = {
    Name : "r2j-gateway"
  }
}

resource "aws_route_table" "r2j-route-table" {
  vpc_id = aws_vpc.r2j-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.r2j-gateway.id
  }
}

resource "aws_route_table_association" "r2j-route-table_association" {
  subnet_id      = aws_subnet.r2j-subnet.id
  route_table_id = aws_route_table.r2j-route-table.id
}