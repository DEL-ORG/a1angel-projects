resource "aws_security_group" "a1angel_sg" {
  vpc_id = data.aws_vpc.a1angel_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.tags, {
    Name = "a1angel_sg"
  })
}
resource "aws_security_group_rule" "a1angel_sg_rule" {
  for_each          = { for pts, port in var.a1angel_ports : pts => port }
  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.a1angel_sg.id

}