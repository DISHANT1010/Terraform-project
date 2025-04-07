resource "aws_s3_bucket" "infra_app_bucket" {
  bucket = "infra-app-bucket"

  tags = {
    Name = "infra-app-bucket"
  }
}