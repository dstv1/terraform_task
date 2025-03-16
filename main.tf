provider "tfe" {
  token    = var.mytf_api_token
  organization = var.organization
}

resource "tfe_project" "project-1" {
  name = "project-1"
}

resource "tfe_variable_set" "varset-ENV-TF" {
  name         = "varset-ENV-TF"
}

resource "tfe_variable" "var-TF" {
  key             = "TF"
  value           = "Terraform"
  category        = "terraform"
  description     = "TF Hi all CLI workspaces"
  variable_set_id = tfe_variable_set.varset-ENV-TF.id
}

resource "tfe_variable" "var-ENV" {
  key             = "DEV"
  value           = "DEV"
  category        = "env"
  description     = "ENV Hi all CLI workspaces"
  variable_set_id = tfe_variable_set.varset-ENV-TF.id
}

resource "tfe_workspace_variable_set" "varset-workspaces-ENV-TF-1" {
  variable_set_id = tfe_variable_set.varset-ENV-TF.id
  workspace_id    = tfe_workspace.CLI-1.id
}
resource "tfe_workspace_variable_set" "varset-workspaces-ENV-TF-2" {
  variable_set_id = tfe_variable_set.varset-ENV-TF.id
  workspace_id    = tfe_workspace.CLI-2.id
}
resource "tfe_workspace_variable_set" "varset-workspaces-ENV-TF-3" {
  variable_set_id = tfe_variable_set.varset-ENV-TF.id
  workspace_id    = tfe_workspace.CLI-3.id
}



resource "tfe_oauth_client" "vcs-provider" {
  name             = "HCP Terraform (my-test-hcporg)"
  organization     = "my-test-hcporg"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.gh_token
  service_provider = "github"
  organization_scoped = true
}

resource "tfe_workspace" "VCS" {
  name                 = "VCS"
  queue_all_runs       = false
  project_id    = tfe_project.project-1.id
    vcs_repo {
    branch             = "main"
    identifier         = "dstv1/repository"
    oauth_token_id     = "ghaot-exrDfERxoSCioc4w"
  }
}

resource "tfe_workspace" "CLI-1" {
  name                 = "CLI-1"
project_id    = tfe_project.project-1.id
}

resource "tfe_workspace" "CLI-2" {
  name                 = "CLI-2"
project_id    = tfe_project.project-1.id
}

resource "tfe_workspace" "CLI-3" {
  name                 = "CLI-3"
project_id    = tfe_project.project-1.id
}
