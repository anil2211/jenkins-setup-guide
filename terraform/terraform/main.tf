terraform {
    backend "s3" {
        bucket = "anil-backend-state-bucket"
        key    = "global/stateful/terraform.tfstate"
        region = var.aws_region
        dynamodb_table = "anil-backend-state-lock"  
}   
}

terraform{
    required_providers{
        aws={
            source="hashicorp/aws"
            version= "6.23.0"
        }
    }
}
    
provider "aws" {
    region = var.aws_region

}