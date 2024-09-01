resource "aws_s3_bucket" "mybucket" {
    bucket_prefix = "static-website-bucket"
    //region       = "ap-south-1"
    force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
    bucket                  = aws_s3_bucket.mybucket.id
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}


resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.mybucket.id
    key    = "index.html"
    source = "index.html"
    content_type = "text/html"
}

resource "aws_s3_object" "error" {
    bucket = aws_s3_bucket.mybucket.id
    key    = "error.html"
    source = "error.html"
    content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "s3_bucket_website" {
    bucket = aws_s3_bucket.mybucket.id
    index_document {
        suffix = "index.html"
    }
    error_document {
        key = "error.html"
    }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
    depends_on = [aws_s3_bucket_public_access_block.public_access_block]
    bucket     = aws_s3_bucket.mybucket.id
    policy = jsonencode(
        {
        "Version" : "2012-10-17",
        "Statement" : [
            {
            "Sid" : "PublicReadGetObject",
            "Effect" : "Allow",
            "Principal" : "*",
            "Action" : "s3:GetObject",
            "Resource" : "arn:aws:s3:::${aws_s3_bucket.mybucket.id}/*"
            }
        ]
        }
    )
}