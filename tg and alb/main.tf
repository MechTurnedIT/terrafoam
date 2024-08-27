resource "aws_lb_target_group" "target" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-017763ccc560eb33a"
}

resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-009e1bc0e16e88a6c","subnet-0220212bf95070aa8"]
  depends_on = [ aws_lb_target_group.target ]
  tags = {
    Name = "ALB"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
  depends_on = [ aws_lb_target_group.target ]
}


# resource "aws_lb_listener" "back_end2" {
#   load_balancer_arn = aws_lb.back_end.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = aws_acm_certificate.cert.arn

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.back_end.arn
#   }
#   depends_on = [ aws_lb_target_group.back_end ]
  
# }