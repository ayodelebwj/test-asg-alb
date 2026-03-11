<<<<<<< HEAD
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
=======
resource "aws_lb_listener" "frontend_alb_tg_listener" {
  load_balancer_arn = aws_lb.frontend_alb.arn
>>>>>>> 1186477230439599db5a04b908d1006f30f44f81
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
<<<<<<< HEAD
    target_group_arn = aws_lb_target_group.frontend.arn
  }
}

#resource "aws_lb_listener" "https" {
 # load_balancer_arn = aws_lb.app_lb.arn
 # port              = 443
  #protocol          = "HTTPS"
 # ssl_policy        = "ELBSecurityPolicy-2016-08"
 # certificate_arn   = "arn:aws:acm:region:account:certificate/xxxx"

 # default_action {
  #  type             = "forward"
  #  target_group_arn = aws_lb_target_group.frontend.arn
  #}
#}
=======
    target_group_arn = aws_lb_target_group.frontend_tg.arn
  }
}

>>>>>>> 1186477230439599db5a04b908d1006f30f44f81
