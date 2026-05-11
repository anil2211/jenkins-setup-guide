resource "aws_instance" "workspace_ec2" {
  ami = "ami-0c2b8ca1dad447f8" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"
    tags = {
        Name = "Instance-${terraform.workspace}"
        Environment = terraform.workspace
    }
}