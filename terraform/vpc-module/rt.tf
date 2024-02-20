resource "aws_route_table" "a1angel_public_rt" {
  vpc_id = aws_vpc.a1angel_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.a1angel_igw.id
  }

  tags = merge(var.tags, {
    Name = format("%s-a1angel_public_rt", var.tags["id"])
    }
  )
}
resource "aws_route_table_association" "a1angel_private_rt_associate" {
  count          = length(var.availability_zone)
  subnet_id      = element(aws_subnet.a1angel_public_subnet.*.id, count.index)
  route_table_id = aws_route_table.a1angel_public_rt.id
}

resource "aws_route_table" "a1angel_private_rt" {
  count                  = length(var.availability_zone)
  vpc_id = aws_vpc.a1angel_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.a1angel_nat_gateway.*.id, count.index)
  }

  tags = merge(var.tags, {
    Name = format("%s-a1angel_private_rt-${count.index}", var.tags["id"])
    }
  )
}
resource "aws_route_table_association" "a1angel_private_rt_associate" {
  count          = length(var.availability_zone)
  subnet_id      = element(aws_subnet.a1angel_private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.a1angel_private_rt.*.id, count.index)
}