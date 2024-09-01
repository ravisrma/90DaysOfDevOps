output "websiteendpoint" {
    value = aws_s3_bucket_website_configuration.s3_bucket_website.website_endpoint
    description = "The website endpoint"
}