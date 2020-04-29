provider "aws" {
  version = "~> 2.0"
  profile = var.profile
  region  = var.region
}

#################### Data ####################

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_acm_certificate" "domain" {
  domain   = "*.${var.domain}"
  statuses = ["ISSUED"]
}

data "aws_route53_zone" "domain" {
  name = var.domain
}

#################### Network ####################
/*
Hashicorp Verified Module
https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws
*/
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.0"

  cidr = "10.0.0.0/16"

  azs             = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]

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
  ver    = "~> 3.2"

  vpc_id      = module.vpc.vpc_id
  cidr_blocks = list(module.vpc.vpc_cidr_block)
}

#################### Service ####################