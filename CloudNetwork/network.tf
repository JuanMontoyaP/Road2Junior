# Public Routes
resource "aws_internet_gateway" "igt-nebo" {
  vpc_id = aws_vpc.vnet-nebo.id

  tags = {
    Name = "igt-nebo"
  }
}

resource "aws_route_table" "public-route-nebo" {
  vpc_id = aws_vpc.vnet-nebo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igt-nebo.id
  }

  tags = {
    Name = "public-route-nebo"
  }
}

resource "aws_route_table_association" "crta-public-subnet-nebo" {
  subnet_id      = aws_subnet.snet-public.id
  route_table_id = aws_route_table.public-route-nebo.id
}

# Private Routes
resource "aws_eip" "nat-gateway" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gateway-nebo" {
  allocation_id = aws_eip.nat-gateway.id
  subnet_id     = aws_subnet.snet-public.id

  tags = {
    Name = "nat-gateway-nebo"
  }

  depends_on = [
    aws_internet_gateway.igt-nebo
  ]
}

resource "aws_route_table" "private-route-nebo" {
  vpc_id = aws_vpc.vnet-nebo.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway-nebo.id
  }

  tags = {
    Name = "prod-private-crt"
  }
}

resource "aws_route_table_association" "crta-private-subnet-nebo" {
  subnet_id      = aws_subnet.snet-private.id
  route_table_id = aws_route_table.private-route-nebo.id
}
