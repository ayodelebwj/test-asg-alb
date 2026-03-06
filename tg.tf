resource "aws_lb_target_group" "frontend_tg" {
  name     = "frontend-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.existing_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200"
  }

  target_type = "instance"

  tags = {
    Name = "frontend-target-group"
  }
}
