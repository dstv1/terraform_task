variable "mytf_api_token" {
  description = "The token used to authenticate with Terraform Cloud/Enterprise"
  type        = string
  sensitive   = true
}

variable "gh_token" {
  description = "The token used to authenticate with Github"
  type        = string
  sensitive   = true
}

variable "var-ENV" {
  description  = "ENV Hi all CLI workspaces"
  type        = string
}

variable "var-TF" {
  description  = "TF Hi all CLI workspaces"
  type        = string
}
