variable "tfe_token" {
  description = "value of the TFE token"
  type        = string
  sensitive   = true
}

variable "gh_pat" {
  description = "value of the GitHub PAT"
  type        = string
  sensitive   = true
}

variable "organization" {
  description = "name of the TFE organization"
  type        = string
  default     = "aws_david_20"
}

variable "oauth_name" {
  description = "name of the OAuth client"
  type        = string
  default     = "aws-gke-github"
}

variable "workspaces_name" {
  default     = "app-vpc"
  description = "workspace eks"
  type        = string
}

# variable "private_subnets" {
#   description = "Subnet private"
#   type = list(string)
#   default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
# }

# variable "public_subnets" {
#   description = "Public Subnets"
#   type = list(string)
#   default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
# }

# variable "cidr_block" {
#   description = "CIDR block for the VPC"
#   type        = string
#   default     = "10.0.0.0/16"
# }

# variable "environment" {
#   description = "Environment name"
#   type        = string
#   default     = "dev"

# }