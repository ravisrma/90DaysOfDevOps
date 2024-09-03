resource "aws_db_instance" "my_db" {
    allocated_storage = 20
    db_name = var.db_name
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t3.micro"
    username = var.db-username
    password = var.db-password
    parameter_group_name = "default.mysql5.7"
    db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
    vpc_security_group_ids = [aws_security_group.my_db_sg.id]
    skip_final_snapshot = true
}