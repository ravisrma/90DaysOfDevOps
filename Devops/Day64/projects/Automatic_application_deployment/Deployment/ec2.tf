resource "aws_instance" "my-terraform-ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.my-terraform-key.key_name
    subnet_id = aws_subnet.my-terraform-subnet.id
    vpc_security_group_ids = [aws_security_group.tfsg.id]
    tags = {
        Name = "my-terraform-ec2"
    }
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("~/.ssh/my-terraform-key")
        host = self.public_ip
    }
    provisioner "file" {
        source = "../Flask Application/app.py"
        destination = "/home/ubuntu/app.py"
    }
    provisioner "file" {
        source = "../Flask Application/templates"
        destination = "/home/ubuntu/templates"
    }
    provisioner "remote-exec" {
        inline = [
            "echo 'Hello from the remote instance'",
            "sudo apt update -y",  # Update package lists (for ubuntu)
            "sudo apt-get install -y python3-pip",  # Install pip
            "sudo pip3 install flask",
            "sudo bash -c 'cat > /etc/systemd/system/flask_app.service <<EOF\n[Unit]\nDescription=Flask Application\n[Service]\nExecStart=/usr/bin/python3 /home/ubuntu/app.py\nRestart=always\nUser=ubuntu\nEnvironment=PYTHONUNBUFFERED=1\n[Install]\nWantedBy=multi-user.target\nEOF'",
            "sudo systemctl daemon-reload",
            "sudo systemctl enable flask_app.service",
            "sudo systemctl start flask_app.service"
        ]
    }
    timeouts {
        create = "10m"
    }
}