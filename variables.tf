variable "env" {
  default     = "example"
  description = "example / dev / test / production"
}

variable "profile" {
  default     = "default"
  description = "this must be matched with region variable"
}

variable "region" {
  default     = "us-east-1"
  description = "default profile uses us-east-1"
}

variable "name" {
  default     = ""
  description = "infrastructure name"
}

variable "ssh-key" {
  description = "ssh key name for ec2 instances"
}

variable "vpc-cidr" {
  description = "VPC CIDR"
}

variable "public-subnets" {
  description = ""
  type        = list(string)
}

variable "private-subnets" {
  description = ""
  type        = list(string)
}

variable "tags" {
  description = "global tags. It'll be merged with modules' tags"
  type        = map(string)
}


