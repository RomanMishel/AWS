terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIAVIURT5M5L7ZA5AN5"
  secret_key = "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"

}

resource "aws_instance" "demoinstance1" {
  ami           = "ami-04e601abe3e1a910f"
  instance_type = "t2.micro"
  
}

resource "aws_instance" "demoinstance2" {
  ami           = "ami-04e601abe3e1a910f"
  instance_type = "t2.micro"
  
}

resource "vpc" "myvpc" {
  source = "terraform-aws-modules/vpc/aws"
    version = "3.5.0"

    name = "main"
    cidr = "10.0.0.0/16"

    azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

    enable_nat_gateway = true
    single_nat_gateway = true

    tags = {
        Terraform = "true"
        Enviroment = "dev"
  
  }

}