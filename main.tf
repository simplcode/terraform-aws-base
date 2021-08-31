provider "aws" {
  profile = var.profile
  region  = var.region
}

#################### Data ####################

data "aws_availability_zones" "available" {
  state = "available"
}

#################### Network ####################
/*
Hashicorp Verified Module
https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws
*/
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 3.6.0"

  cidr = var.vpc-cidr
  azs = data.aws_availability_zones.available.names[*]
  public_subnets  = var.public-subnets
  private_subnets = var.private-subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = merge(var.tags,
    {
      Name        = var.name
      Environment = var.env
  })
}

/*
Hashicorp Verified Module
https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws
*/
module "security_group" {
  source = "./security-group"
  ver    = ">= 4.3"

  vpc_id      = module.vpc.vpc_id
  cidr_blocks = [var.vpc-cidr]
}
