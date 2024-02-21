resource "aws_internet_gateway" "a1angel_igw" {
  vpc_id = aws_vpc.a1angel_vpc.id

  tags = merge(var.tags, {
    Name = format("%s-a1angel_igw", var.tags["id"])
    }
  )
}