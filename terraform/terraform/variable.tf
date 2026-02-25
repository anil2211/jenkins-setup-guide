# variables in terraform

# aws region variable

variable "aws_region" {
  description = "AWS region where  our resources will get created"
  type        = string
  default = "ap-south-1"
}

# ec2 instance type

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}


# key pair name
variable "key_name" {
  description = "key pair name for ec2 instance"
  type = string
  default = "terraform-key"

}

# ami id
variable "ami_id" {
  description = "ami - id for ec2 instance"
  type = string
  default = "ami-02b33434gv343v2323"

}

# security group name
variable "aws_security_group_name" {
  description = "Name of security group"
  type = string
  default = "terraform-ec2-sg"

}
