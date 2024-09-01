terraform {
    backend "s3" {
        bucket = "terraform-bucket-0527"
        key    = "./terraform.tfstate"
        dynamodb_table = "terraform_state_lock"
        region = "ap-south-1"
        encrypt = true
    }
}