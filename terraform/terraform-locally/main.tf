terraform {
    backend "s3" {
        bucket = "anil-backend-state-bucket"
        key    = "global/stateful/terraform.tfstate"
        region = var.aws_region
        dynamodb_table = "anil-backend-state-lock"  
}   
}

locals {
  env = var.environment != "" ? var.environment : terraform.workspace
  
}