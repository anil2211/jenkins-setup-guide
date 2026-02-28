# variables in terraform

# aws region variable

variable "aws_region" {
  description = "AWS region where  our resources will get created"
  type        = string
  default     = "ap-south-1"
}

# ec2 instance type

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}


# key pair name
variable "key_name" {
  description = "key pair name for ec2 instance"
  type        = string
  default     = "terraform-key"

}

# ami id
variable "ami_id" {
  description = "ami - id for ec2 instance"
  type        = string
  default     = "ami-02b33434gv343v2323"

}

# security group name
variable "aws_security_group_name" {
  description = "Name of security group"
  type        = string
  default     = "terraform-ec2-sg"

}


#instance count(for count meta arguments)
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 3
}

# instance variable for each
variable "instances" {
  description = "Map of instance names to their configurations"
  type        = map(string)
  default = {
    instance1_micro = "t2.micro",
    instance_medium = "t2.medium",
    instance3_large = "t2.large"
  }
}
