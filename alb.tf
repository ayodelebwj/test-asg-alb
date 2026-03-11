resource "aws_lb" "app_lb" {
  name               = "my-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [data.aws_subnet.public_subnet.id, data.aws_subnet.public_subnet_2.id]
}