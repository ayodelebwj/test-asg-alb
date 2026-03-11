resource "aws_lb" "app_lb" {
  name               = "my-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]

  subnets = data.aws_subnets.public.ids
}