
# generate the ssh key first
# type -t rsa,-b 2048 length,-f mykey name
# ssh-keygen -t rsa -b 2048 -f mykey
# ls

# sudo vim ec2.tf
# key pair resource
resource "aws_key_pair" "my_key"{
    key_name = var.key_name
    public_key = file("mykey.pub")

}

# security group resources

resource "aws_security_group" "ec2_sg"{
    name        = var.aws_security_group_name
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
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.my_key.key_name
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    user_data = file("webscript.sh")
    tags = {
        Name = "terraform-ec2"
    }
}


# output

output "ec2_public_ip" {
    description = "The public IP address of the EC2 instance"
    value = aws_instance.my_ec2.public_ip
}
