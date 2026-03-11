<<<<<<< HEAD
resource "aws_lb" "app_lb" {
  name               = "my-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]

  subnets = data.aws_subnets.public.ids
}
=======
resource "aws_lb" "frontend_alb" {
  name               = "frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [
    data.aws_subnet.public_subnet.id,
    data.aws_subnet.public_subnet_2.id
  ]

  tags = {
    Name = "frontend-alb"
  }
}
>>>>>>> 1186477230439599db5a04b908d1006f30f44f81
