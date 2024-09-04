resource "aws_lb" "mylb" {
    name = var.lb_name
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.mysg.id]
    subnets = [aws_subnet.mysubnet.id, aws_subnet.mysubnet2.id]
}