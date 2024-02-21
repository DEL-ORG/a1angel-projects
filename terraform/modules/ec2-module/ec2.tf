resource "aws_instance" "a1angel_ec2" {
  ami                         = local.instance_ami
  instance_type               = var.instance_type
  key_name                    = var.key
  tenancy                     = var.tenancy
  associate_public_ip_address = var.pub_ip
  vpc_security_group_ids      = [aws_security_group.a1angel_sg.id]
  subnet_id                   = var.subnet_id[0]
  disable_api_termination     = var.api_termination

  root_block_device {
    volume_size = var.volume_size
  }

  tags = merge(var.tags, {
    Name = format("%s-a1ange-ec2", var.tags["id"])
  })

}