resource "aws_lb_listener" "mylblistener" {
    load_balancer_arn = aws_lb.mylb.arn
    port = 80
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.mytargetgroup.arn
    }
}