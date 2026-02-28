resource "aws_dynamodb_table" "tf-lock-table" {
  name         = "anil-backend-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "anil-backend-state-lock"
  }
}