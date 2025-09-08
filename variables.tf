variable "organization" {
  description = "my-test-hcporg"
  type        = string
  sensitive   = true
}

variable "terraform_api_token" {
  description = "The token used to authenticate with Terraform Cloud/Enterprise"
  type        = string
  sensitive   = true
}

variable "github_api_token" {
  description = "The token used to authenticate with Github"
  type        = string
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description  = "allowing your workspaces to authenticate to AWS"
  type        = string
}

variable "region" {
  description  = "The AWS region to deploy resources into"
  type        = string
}
