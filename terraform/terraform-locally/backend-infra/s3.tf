resource "aws_s3-bucket" "remote-s3" {
  bucket = "terraform-remote-state-bucket"
  acl    = "private"

  tags = {
    Name        = "Terraform Remote State Bucket"
  }
  
}

