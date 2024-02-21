resource "aws_route_table_association" "a1angel_private_rt_associate" {
  count          = length(var.availability_zone)
  subnet_id      = element(aws_subnet.a1angel_public_subnet.*.id, count.index)
  route_table_id = aws_route_table.a1angel_public_rt.id
}

resource "aws_route_table_association" "a1angel_private_rt_associate" {
  count          = length(var.availability_zone)
  subnet_id      = element(aws_subnet.a1angel_private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.a1angel_private_rt.*.id, count.index)
}