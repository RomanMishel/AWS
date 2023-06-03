# Specify the provider and its configuration
provider "aws" {
  region = "eu-central-1"
}

# Define the security group
resource "aws_security_group" "example_sg" {
  name        = "example-security-group"
  description = "Example security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define the AWS instances
resource "aws_instance" "example_instance1" {
  ami           = "ami-12345678"  # Replace with the desired AMI ID
  instance_type = "t2.micro"
  security_group_ids = [aws_security_group.example_sg.id]
}

resource "aws_instance" "example_instance2" {
  ami           = "ami-12345678"  # Replace with the desired AMI ID
  instance_type = "t2.micro"
  security_group_ids = [aws_security_group.example_sg.id]
}
