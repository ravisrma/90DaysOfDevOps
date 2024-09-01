resource "aws_internet_gateway" "my-terraform-igw" {
    vpc_id = aws_vpc.my-terraform-vpc.id
    tags = {
        Name = "my-terraform-igw"
    }
}