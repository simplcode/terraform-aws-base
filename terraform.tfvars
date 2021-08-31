env     = "example"
region  = "us-east-1"
name    = "example"
ssh-key = "awsnvirginia"
vpc-cidr = "10.0.0.0/16"
public-subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private-subnets = ["10.0.11.0/24", "10.0.12.0/24"]
tags = {
  Terraform = "true"
  Project   = "terraform-aws-base"
}