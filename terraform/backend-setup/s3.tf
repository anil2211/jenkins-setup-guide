resource "aws_s3_bucket" "remote_s3" {
  bucket = "anil-backend-state-bucket"
  tags = {
    Name = "anil-backend-state-bucket"
  }
}