resource "aws_instance" "private_ec2" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_1.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.key.key_name
  user_data              = file("user_data.sh")

  depends_on = [
    aws_nat_gateway.nat,
    aws_route_table_association.private_assoc
  ]
}
