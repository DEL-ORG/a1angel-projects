resource "aws_nat_gateway" "a1angel_nat_gateway" {
  count         = length(var.availability_zone)
  allocation_id = element(aws_eip.a1angel_eip.*.id, count.index)
  subnet_id     = element(aws_subnet.a1angel_public_subnet.*.id, count.index)

  tags = merge(var.tags, {
    Name = format("%s-a1angel_nat_gateway-${count.index}", var.tags["id"])
    }
  )

  depends_on = [aws_internet_gateway.a1angel_igw]
}