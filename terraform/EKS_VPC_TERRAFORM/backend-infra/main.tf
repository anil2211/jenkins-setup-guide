resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "my-terraform-state-bucket-1234567890"
  acl    = "private"
  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
  
}

resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_bucket_encryption" {
  bucket = aws_s3_bucket.tf_state_bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "tf_lock" {
    name         = "terraform-lock-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"
    
    attribute {
        name = "LockID"
        type = "S"
    }
    
    tags = {
        Name        = "Terraform Lock Table"
        Environment = "Dev"
    }
}