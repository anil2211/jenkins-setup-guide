# terraform state management
# terraform show
# terraform.tfstate - it manage the terraform 
# cat terraform.tfstate
# terraform apply
# cat terraform .tfstate file will get updated with the current state of the infrastructure
# terraform show - it will show the current state of the infrastructure in a human readable format
# terraform state list - it will list all the resources that are currently managed by terraform
# terraform state show <resource_name> - it will show the details of a specific resource
# terraform state rm <resource_name> - it will remove a specific resource from the state file
# terraform state mv <source_resource_name> <destination_resource_name> - it will move a
# terraform refresh - it will update the state file with the current state of the infrastructure
# terraform import <resource_name> <resource_id> - it will import an existing resource into the state file

# launch ec2 new manually-imported_ec2
# sudo vim ec2.tf
# 
# temporary resource block for import
resource "aws_instance" "imported_ec2"{
    # empty block for import
}

# terraform init
# terraform import aws_instance.my_ec2 i-0a1b2c3d4e5f6g7h8
# it will import the manually create aws instance

# terraform plan
# terraform validate
# terraform state list
# terraform state show aws_instance.my_ec2
# copy ami id,type,region
# sudo vim ec2.tf
# temporary resource block for import
resource "aws_instance" "imported_ec2"{
    # empty block for import
    ami = "paste the ami id "
    instance_type = "t3.micro"
    tags = {
        Name = "imported-ec2"
    }
}

# terraform plan
# terraform apply
# terraform show
# terraform destroy


# use dynamoDB
# S3 simple storage service

# mkdir backend-setup
# sudo vim terraform.tf
# sudo vim provider.tf
# sudo vim s3.tf
resource "aws_s3_bucket" "remote_s3" {
  bucket = "anil-backend-state-bucket"
  tags = {
    Name = "anil-backend-state-bucket"
  }
}

# sudo vim dynamodb.tf
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





# terraform init
# terraform validate
# terraform plan
# terraform apply




# terraform -reconfigure init
# terraform validate
# terraform plan
# terraform apply







