provider "tfe" {
  token    = var.terraform_api_token
  organization = var.organization
}

resource "tfe_project" "project_test" {
  name = "project_test"
}

resource "tfe_variable_set" "deployment_region_and_key" {
  name         = "deployment_region_and_key"
}

resource "tfe_variable" "region" {
  key             = "region"
  value           = "us-east-1"
  category        = "terraform"
  description     = "The AWS region to deploy resources into"
  variable_set_id = tfe_variable_set.deployment_region_and_key.id
}

resource "tfe_variable" "AWS_SECRET_ACCESS_KEY" {
  key             = "AWS_SECRET_ACCESS_KEY"
  value           = "12345"
  category        = "env"
  description     = "allowing your workspaces to authenticate to AWS"
  variable_set_id = tfe_variable_set.deployment_region_and_key.id
}

resource "tfe_workspace_variable_set" "deployment_region_and_key_1" {
  variable_set_id = tfe_variable_set.deployment_region_and_key.id
  workspace_id    = tfe_workspace.stage_AWS_1.id
}
resource "tfe_workspace_variable_set" "deployment_region_and_key_2" {
  variable_set_id = tfe_variable_set.deployment_region_and_key.id
  workspace_id    = tfe_workspace.stage_AWS_2.id
}
resource "tfe_workspace_variable_set" "deployment_region_and_key_3" {
  variable_set_id = tfe_variable_set.deployment_region_and_key.id
  workspace_id    = tfe_workspace.stage_AWS_3.id
}



resource "tfe_oauth_client" "github-oauth" {
  name             = "github-oauth"
  organization     = "my-test-hcporg"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_api_token
  service_provider = "github"
  organization_scoped = true
}

resource "tfe_workspace" "VCS-Github" {
  name                 = "VCS-Github"
  queue_all_runs       = false
  project_id    = tfe_project.project-1.id
    vcs_repo {
    branch             = "main"
    identifier         = "dstv1/tf-vcs-repo"
    oauth_token_id     = tfe_oauth_client.github-oauth.oauth_token_id
  }
}

resource "tfe_workspace" "stage_AWS_1" {
  name                 = "stage_AWS_1"
project_id    = tfe_project.project_test.id
}

resource "tfe_workspace" "stage_AWS_2" {
  name                 = "stage_AWS_2"
project_id    = tfe_project.project_test.id
}

resource "tfe_workspace" "stage_AWS_3" {
  name                 = "stage_AWS_3"
project_id    = tfe_project.project_test.id
}
