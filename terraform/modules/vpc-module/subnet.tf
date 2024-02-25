resource "aws_subnet" "a1angel_private_subnet" {
  count             = length(var.availability_zone)
  vpc_id            = aws_vpc.a1angel_vpc.id
  cidr_block        = cidrsubnet(var.cidr, 8, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = merge(var.tags, {
    Name = format("%s-a1angel_private_subnet-${count.index}", var.tags["environment"])
    "kubernetes.io/role/internal-elb" = 1
    }
  )
}
resource "aws_subnet" "a1angel_public_subnet" {
  count      = length(var.availability_zone)
  vpc_id     = aws_vpc.a1angel_vpc.id
  cidr_block = cidrsubnet(var.cidr, 6, count.index + 1)

  tags = merge(var.tags, {
    Name = format("%s-a1angel_public_subnet-${count.index}", var.tags["environment"])
    "kubernetes.io/role/elb" = 1
    }
  )
}
