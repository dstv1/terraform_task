variable "organization" {
  description = "my-test-hcporg"
  type        = string
}

variable "terraform_api_token" {
  description = "The token used to authenticate with Terraform Cloud/Enterprise"
  type        = string
}

variable "github_api_token" {
  description = "The token used to authenticate with Github"
  type        = string
}

variable "aws_region" {
  description = "Terraform variable for deployment region"
  type        = string
}

variable "aws_secret_key" {
  description = "Environment variable for AWS Secret Access Key"
  type        = string
}
