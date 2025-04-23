terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

    tfe = {
      source  = "hashicorp/tfe"
      version = ">=0.45.0"
    }
  }
}