output "Web-Link" {
    value = "http://${aws_instance.my-terraform-ec2.public_ip}:5000" 
}