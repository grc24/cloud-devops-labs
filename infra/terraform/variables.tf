variable "tfe_token" {
  description = "value of the TFE token"
  type        = string
}

variable "gh_pat" {
  description = "value of the GitHub PAT"
  type        = string
}

variable "organization" {
  description = "name of the TFE organization"
  type        = string
}

variable "oauth_name" {
  description = "name of the OAuth client"
  type        = string
  default     = "aws-gke-github"
}