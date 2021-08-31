variable "ver" {
  type        = string
  description = "module version"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "cidr_blocks" {
  type        = list(string)
  description = "VPC CIDR blocks"
}

module "web_http" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name                = "web-http"
  description         = "Security group for web-server with HTTP ports open to public"
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "web_https" {
  source = "terraform-aws-modules/security-group/aws//modules/https-443"

  name                = "web-https"
  description         = "Security group for web-server with HTTPS ports open to public"
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "ssh" {
  source = "terraform-aws-modules/security-group/aws//modules/ssh"

  name                = "ssh"
  description         = "Security group for ssh-server with default ssh port open to public"
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}