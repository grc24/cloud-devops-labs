terraform {
  cloud {
    organization = "your-organization-name"

    workspaces {
      name = "your-workspace-name"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}