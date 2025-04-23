
# # Filter out local zones, which are not currently supported 
# # with managed node groups
# data "aws_availability_zones" "available" {
#   filter {
#     name   = "opt-in-status"
#     values = ["opt-in-not-required"]
#   }
# }

# locals {
#   cluster_name = "labs-eks-${random_string.suffix.result}"
# }

# resource "random_string" "suffix" {
#   length  = 8 
#   special = false
# }

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "${local.cluster_name}-vpc"
#   cidr = var.cidr_block
#   azs  = data.aws_availability_zones.available.names
 
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = true
#   enable_vpn_gateway = true

#   tags = {
#     Terraform = "true"
#     Environment = "dev"
#   }
# }