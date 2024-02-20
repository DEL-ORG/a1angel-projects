resource "aws_vpc" "a1angel_vpc" {
  cidr_block = var.cidr
  tags = merge(var.tags, {
    Name = "a1angel_vpc"
    }

  )
}