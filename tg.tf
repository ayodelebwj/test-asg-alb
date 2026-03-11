resource "aws_lb_target_group" "frontend_tg" {
  name     = "frontend-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_lb_target_group_attachment" "frontend_ec2" {
  target_group_arn = aws_lb_target_group.frontend_tg.arn
  target_id        = aws_instance.frontend_az_2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "frontend_ec1" {
  target_group_arn = aws_lb_target_group.frontend_tg.arn
  target_id        = aws_instance.frontend_az_1.id
  port             = 80
}