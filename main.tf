terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
}

######################  VPC  #############################
resource "aws_vpc" "najeeb" { 
  cidr_block = "182.19.0.0/24"
  tags={
    Name="najeeb-vpc"
  }
}
######################  subnet App  #############################
resource "aws_subnet" "subnet_app" {
  vpc_id = aws_vpc.najeeb.id
  cidr_block = "182.19.0.0/27"
  tags={
    Name="subnet_app"
  }
}
######################  Subnet Web  #############################
resource "aws_subnet" "subnet_web" {
  vpc_id = aws_vpc.najeeb.id
  cidr_block = "182.19.0.32/27"
  tags={
    Name="subnet_web"
  }
}
######################  Subnet db  #############################
resource "aws_subnet" "subnet_db" {
  vpc_id = aws_vpc.najeeb.id
  cidr_block = "182.19.0.64/28"
  tags={
    Name="subnet_db"
  }
}