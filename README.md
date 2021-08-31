# Terraform configuration template

This configuration template creates set of VPC resources across multiple AZs.

As you define public/private subnets, configuration will coordinate an AZ per each subnet. Determine you are using a region with sufficient number of AZs. 

## Template Configuration will Create
- VPC with CIDR: 10.0.0.0/16
- 3 Public/Private Subnets
- NAT per private subnet
- Subnet per each AZs
- Security Groups with predefined rules [http, https, ssh]

## Requirements
| Name | Version |
|------|---------|
| Terraform |    >= 1.0.5 |
| AWS CLI |  |

## Provider & Modules
AWS Version(>= 3.56)

| Module | Version |
|--------|---------|
| VPC |    >= 3.6.0 |
| Security Group |    >= 4.3 |


## Usage
Specify VPC CIDR and subnets along with region, etc. in terraform.tfvars.

Execute following commands: 
```bash
$ terraform init
$ terraform plan
$ terraform apply
```

