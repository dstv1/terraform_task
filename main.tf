provider "tfe" {
  token    = var.terraform_api_token
  organization = var.organization
}

resource "tfe_project" "project" {
  name = "project"
}

resource "tfe_variable_set" "deployment_region" {
  name         = "deployment_region"
}

resource "tfe_variable" "region" {
  key             = "region"
  value           = "usa"
  category        = "terraform"
  description     = "deployment region"
  variable_set_id = tfe_variable_set.deployment_region.id
}

resource "tfe_variable" "AWS_REGION" {
  key             = "AWS_REGION"
  value           = "us-east-1"
  category        = "env"
  description     = "AWS region"
  variable_set_id = tfe_variable_set.deployment_region.id
}

resource "tfe_workspace_variable_set" "deployment_region_1" {
  variable_set_id = tfe_variable_set.deployment_region.id
  workspace_id    = tfe_workspace.stage_AWS_1.id
}
resource "tfe_workspace_variable_set" "deployment_region_2" {
  variable_set_id = tfe_variable_set.deployment_region.id
  workspace_id    = tfe_workspace.stage_AWS_2.id
}
resource "tfe_workspace_variable_set" "deployment_region_3" {
  variable_set_id = tfe_variable_set.deployment_region.id
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
