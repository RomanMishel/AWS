provider "aws" {
    region = "eu-central-1"
    access_key = var.access_key
    secret_key = var.secret_key
  
}

data "aws_security_group" "Ubuntu_TestSandaVPC_Security_Group" {
    id = "sg-0fa26dca5afdae69d"
  
}

resource "aws_instance" "example_instance1" {
  ami           = "ami-04e601abe3e1a910f"  # Replace with the desired AMI ID
  instance_type = "t2.micro"
  key_name      = "Test_SadnaVPC"
}

resource "aws_instance" "example_instance2" {
  ami           = "ami-04e601abe3e1a910f"  # Replace with the desired AMI ID
  instance_type = "t2.micro"
  key_name      = "Test_SadnaVPC"
}
