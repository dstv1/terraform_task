provider "tfe" {
  token    = var.terraform_api_token
  organization = var.organization
}

resource "tfe_project" "project" {
  name = "project"
}

resource "tfe_variable_set" "aws_deployment" {
  name         = "aws_deployment"
}

resource "tfe_variable" "aws_region" {
  key             = "aws_region"
  value           = var.aws_region
  category        = "terraform"
  description     = "Terraform variable for deployment region"
  variable_set_id = tfe_variable_set.aws_deployment.id
}

resource "tfe_variable" "aws_secret_key" {
  key             = "aws_secret_key"
  value           = var.aws_secret_key
  category        = "env"
  description     = "Environment variable for AWS Secret Access Key"
  variable_set_id = tfe_variable_set.aws_deployment.id
  sensitive   = true
}

resource "tfe_workspace_variable_set" "aws_deployment_1" {
  variable_set_id = tfe_variable_set.aws_deployment.id
  workspace_id    = tfe_workspace.stage_AWS_1.id
}
resource "tfe_workspace_variable_set" "aws_deployment_2" {
  variable_set_id = tfe_variable_set.aws_deployment.id
  workspace_id    = tfe_workspace.stage_AWS_2.id
}
resource "tfe_workspace_variable_set" "aws_deployment_3" {
  variable_set_id = tfe_variable_set.aws_deployment.id
  workspace_id    = tfe_workspace.stage_AWS_3.id
}


resource "tfe_oauth_client" "github-oauth" {
  name             = "github-oauth"
  organization     = "my-test-hcporg"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_api_token
  service_provider = "github"
}

resource "tfe_workspace" "terraform_vcs" {
  name                 = "terraform_vcs"
  project_id    = tfe_project.project.id
  queue_all_runs       = false
    vcs_repo {
    branch             = "main"
    identifier         = "dstv1/terraform_vcs"
    oauth_token_id     = tfe_oauth_client.github-oauth.oauth_token_id
  }
}

resource "tfe_workspace" "stage_AWS_1" {
  name                 = "stage_AWS_1"
project_id    = tfe_project.project.id
}

resource "tfe_workspace" "stage_AWS_2" {
  name                 = "stage_AWS_2"
project_id    = tfe_project.project.id
}

resource "tfe_workspace" "stage_AWS_3" {
  name                 = "stage_AWS_3"
project_id    = tfe_project.project.id
}
