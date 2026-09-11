variable "aws_region" {
    description = "The AWS region to deploy the S3 bucket to"
    type = string
    sensitive = false
    default = "us-west-2"
}