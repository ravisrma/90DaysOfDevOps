resource "aws_security_group" "tfsg" {
    vpc_id = aws_vpc.my-terraform-vpc.id
    name   = var.sg_name
    dynamic "ingress" {
        for_each = var.ports_list
        content {
        from_port        = ingress.value
        to_port          = ingress.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        //ipv6_cidr_blocks = ["::/0"]  
        }
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        //ipv6_cidr_blocks = ["::/0"]
    }
}
