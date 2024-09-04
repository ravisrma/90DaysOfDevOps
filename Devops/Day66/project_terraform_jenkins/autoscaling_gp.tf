resource "aws_autoscaling_group" "myautoscalinggroup" {
    name = var.asg_name
    max_size = var.max_size
    min_size = var.min_size
    desired_capacity = var.desired_capacity
    vpc_zone_identifier = [aws_subnet.mysubnet.id, aws_subnet.mysubnet2.id]
    target_group_arns = [aws_lb_target_group.mytargetgroup.arn]
    tag {
        key = "Name"
        value = var.asg_name
        propagate_at_launch = true
    }

    launch_template {
        id = aws_launch_template.mylaunchtemplate.id
        version = "$Latest"
    }
}