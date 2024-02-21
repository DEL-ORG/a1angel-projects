resource "aws_eip" "a1angel_eip" {
  count = length(var.availability_zone)
  vpc   = true
  tags = merge(var.tags, {
    Name = format("%s-a1angel_eip-${count.index}", var.tags["id"])
    }
  )
  depends_on = [aws_internet_gateway.a1angel_igw]
}