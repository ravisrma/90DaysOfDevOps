resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_name
    }
    
}
resource "aws_subnet" "pub_subnet1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.pub_subnet1_cidr
    availability_zone = var.subnet1_az
    map_public_ip_on_launch = true
    tags = {
        Name = "my-pub-subnet1"
    }
}
resource "aws_subnet" "pub_subnet2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.pub_subnet2_cidr
    availability_zone = var.subnet2_az
    map_public_ip_on_launch = true
    tags = {
        Name = "my-pub-subnet2"
    }
}
resource "aws_subnet" "pri_subnet1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.pri_subnet1_cidr
    availability_zone = var.subnet1_az
    tags = {
        Name = "my-pri-subnet1"
    }
}
resource "aws_subnet" "pri_subnet2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.pri_subnet2_cidr
    availability_zone = var.subnet2_az
    tags = {
        Name = "my-pri-subnet2"
    }
}
resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = var.igw_name
    }
}
resource "aws_route_table" "my_rt" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
    tags = {
        Name = var.rt_name
    }
}
resource "aws_route_table_association" "pub_subnet1_rt_association" {
    subnet_id = aws_subnet.pub_subnet1.id
    route_table_id = aws_route_table.my_rt.id
}
resource "aws_route_table_association" "pub_subnet2_rt_association" {
    subnet_id = aws_subnet.pub_subnet2.id
    route_table_id = aws_route_table.my_rt.id
}

resource "aws_lb" "my_lb" {
    name = var.lb_name
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.my_lb_sg.id]
    subnets = [aws_subnet.pub_subnet1.id, aws_subnet.pub_subnet2.id]
    tags = {
        Name = var.lb_name
    }
}
resource "aws_lb_listener" "my_lb_listener" {
    load_balancer_arn = aws_lb.my_lb.arn
    port = 80
    protocol = "HTTP"
    
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.my_tg.arn
    }
}

resource "aws_lb_target_group" "my_tg" {
    name = var.tg_name
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = var.tg_name
    }
}

resource "aws_lb_target_group_attachment" "my_tg_attachment" {
    target_group_arn = aws_lb_target_group.my_tg.arn
    target_id = aws_instance.my_instance-1.id
    port = 80
}

resource "aws_lb_target_group_attachment" "my_tg_attachment2" {
    target_group_arn = aws_lb_target_group.my_tg.arn
    target_id = aws_instance.my_instance-2.id
    port = 80
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
    name = var.db_subnet
    subnet_ids = [aws_subnet.pri_subnet1.id, aws_subnet.pri_subnet2.id]
    tags = {
        Name = var.db_subnet
    }
}
