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

variable "AWS_REGION" {
  description  = "AWS region"
  type        = string
}

variable "region" {
  description = "deployment region"
  type        = string
}
