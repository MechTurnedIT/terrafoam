resource "aws_lb_target_group" "target" {
  name     = "tg"
  port     =  80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.custvpc.id

}

resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [data.aws_subnet.sub1.id, data.aws_subnet.sub2.id]
  security_groups = [ data.aws_security_group.sg.id ]
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