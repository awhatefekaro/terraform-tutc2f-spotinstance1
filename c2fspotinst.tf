# Requesting a spot instance
resource "aws_spot_instance_request" "c2fSptInst" {
  ami           = "ami-063d43db0594b521b"
  spot_price    = "0.0029"
  instance_type = "t2.micro"
  spot_type     = "one-time"

  tags          = { 
    Name        = "c2fSptInst"
    Createdfor  = "C2F"
  }
}
# Configure the AWS Provider
provider "aws" {
#  version = "~> 3.0"
  region  = "us-east-1"
  profile = "gitoffterraformprofile"
}
#Configure remote backend
terraform {
  backend "s3" {
    bucket = "c2fterraformbukt"
    key    = "spotinststatefile"
    dynamodb_table = "terrafmdbtbl"
    region = "us-east-1"
    profile = "gitoffterraformprofile"
  }
}

