resource "aws_lb_target_group" "mytargetgroup" {
    name = var.tg_name
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.myvpc.id
    target_type = "instance"
    tags = {
        Name = var.tg_name
    }
}