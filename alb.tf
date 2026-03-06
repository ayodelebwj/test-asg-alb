resource "aws_lb" "frontend_alb" {
  name               = "frontend_alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [
    data.aws_subnet.public_subnet.id,
    data.aws_subnet.public_subnet_2.id
  ]

  tags = {
    Name = "frontend_alb"
  }
}
