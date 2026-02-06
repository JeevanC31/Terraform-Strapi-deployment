resource "aws_lb" "alb" {
  name               = "task4-alb"
  load_balancer_type = "application"
  subnets            = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
  security_groups = [aws_security_group.alb_sg.id]
}


resource "aws_lb_target_group" "tg" {
  port     = 1337
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
  path                = "/"
  interval            = 60
  timeout             = 10
  healthy_threshold   = 2
  unhealthy_threshold = 10
  matcher             = "200-399"
}   
}


resource "aws_lb_target_group_attachment" "attach" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.private_ec2.id
  port             = 1337
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
