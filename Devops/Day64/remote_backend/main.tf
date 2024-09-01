resource "aws_instance" "firstec2" {
  ami           = var.ami
  key_name = aws_key_pair.key.key_name
  instance_type = var.instance_type
  tags = {
    Name = "first_ec2"
  }
  vpc_security_group_ids = var.vpc_security_group_ids
}
resource "aws_key_pair" "key" {
  key_name   = "tfkey"
  public_key = tls_private_key.mykey.public_key_openssh
}
resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "tfkey" {
  content  = tls_private_key.mykey.private_key_pem
  filename = "${path.module}/tfkey.pem"
}
resource "aws_s3_bucket" "my_bucket" {
    bucket = "terraform-bucket-0527" 

    lifecycle {
        prevent_destroy = false
    }

    tags = {
        Name        = "My S3 Bucket"
        Environment = "Dev"
    }
}

resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
    bucket = aws_s3_bucket.my_bucket.id
    
    versioning_configuration {
        status = "Enabled"
    }  
}

output "bucket_name" {
    value = aws_s3_bucket.my_bucket.bucket
}
resource "aws_dynamodb_table" "terraform_state_lock" {
    name           = "terraform_state_lock"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        Name = "terraform_state_lock"
    }
    
}
