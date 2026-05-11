resource "aws_key_pair" "my_key" {
  key_name   = "terraform-key-${local.env}" 
    public_key = file("mykey.pub")
  
}

resource "aws_security_group" "web_sg" {
  name        = "terraform-ec2-sg-${local.env}"
  description = "Security group for Terraform EC2 instances"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    ingress  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0/0"]
    }
    tags = {
    Name = "terraform-ec2-sg-${local.env}"
}
}


resource "aws_instance" "my_ec2" {
  for_each = var.instances

  ami           = var.ami_id
  instance_type = each.value
  key_name = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "Terraform Web Server"
  }
}