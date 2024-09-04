resource "aws_key_pair" "my_key" {
    key_name = var.key_name
    public_key = file("~/.ssh/my-terraform-key.pub")
}
resource "aws_launch_template" "mylaunchtemplate" {
    name = var.launch_template_name
    image_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    user_data = filebase64("user-data.sh")
    tags = {
        Name = var.launch_template_name
    }
    network_interfaces {
        associate_public_ip_address = true
        security_groups = [aws_security_group.mysg.id]
    }
    block_device_mappings {
        device_name = var.device_name
        ebs {
            volume_size = var.volume_size
            volume_type = var.volume_type
            delete_on_termination = var.delete_on_termination
        }
    }
    tag_specifications {
        resource_type = var.resource_type
        tags = {
            Name = var.launch_template_name
        }
    }
}