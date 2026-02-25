ec2 instance create using the terraform
-------------------------------------------------
main.tf

terraform{
    required_providers{
        aws={
            source="hashicorp/aws"
            version= "6.23.0"
        }
    }
}

provider "aws" {
    region = "ap-south-1"

}

-----------------------------------------

sudo vim s3.tf

resource "aws_s3_bucket" "my_bucket"{
    bucket = "terraform-learning-with-anil"

    tags={
        Name = "terraform s3 bucket"
        Environment = "Dev"
    }
}

------------------------------

sudo vim ec2.tf

resource "aws_instance" "my_ec2"{
    ami = "ami-02b33434gv343v2323"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform-ec2"
        
    }
}

# it create the ec2 instance on aws
terraform init
terraform validate
terraform plan
terraform apply

# to apply only single file
terraform apply -target=aws_instance.my_ec2 -auto-approve

terraform destroy -auto-approve

--------------------------------------------
sudo vim ec2.tf

# generate the ssh key first
# type -t rsa,-b 2048 length,-f mykey name
ssh-keygen -t rsa -b 2048 -f mykey
ls

sudo vim ec2.tf
# key pair resource
resource "aws_key_pair" "my_key"{
    key_name = "terraform-key"
    public_key = file("mykey.pub")

}

# security group resources

resource "aws_security_group" "ec2_sg"{
    name        = "terraform-ec2-sg"
    description = "Allow SSh and  HTTP traffic Security group for terraform EC2 instance"

    ingress {
        description = "Allow SSH traffic"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow HTTP traffic"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow HTTPS traffic"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "terraform-ec2-sg"
    }
}


# ec2 instance resource
resource "aws_instance" "my_ec2"{
    ami = "ami-02b33434gv343v2323"
    instance_type = "t2.micro"
    key_name = aws_key_pair.my_key.key_name
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]

    tags = {
        Name = "terraform-ec2"
    }
}


# output

output "ec2_public_ip" {
    description = "The public IP address of the EC2 instance"
    value = aws_instance.my_ec2.public_ip
}

# to above file create key,ec2 and security group
terraform init
terraform validate
terraform plan
terraform apply

terraform destroy -auto-approve


ssh -i mykey ubuntu@public_ip










































