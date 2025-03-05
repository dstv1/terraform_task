provider "tfe" {
  token    = var.mytf_api_token
 organization = "my-test-hcporg"
}


resource "tfe_project" "test-project-1" {   
  name = "project-1"                  
}


resource "tfe_workspace" "vcs" {
  name                 = "vcs"
  queue_all_runs       = false  
    vcs_repo {
    branch             = "main"    
    identifier         = "dstv1/repository"       
    oauth_token_id     = var.gh_token 
  }
}

resource "tfe_workspace" "test-CLI-1" {
  name                 = "workspace-CLI-1"
       
}

resource "tfe_workspace" "test-CLI-2" {
  name                 = "workspace-CLI-2"
  
}

resource "tfe_workspace" "test-CLI-3" {
  name                 = "workspace-CLI-3"
  

}



resource "tfe_variable_set" "var-test1" {
  name         = "var-test1"

}

resource "tfe_variable" "var-test1-a" {
  key             = "key1"
  value           = "value1"
  category        = "terraform"
  description     = "test info"
  variable_set_id = tfe_variable_set.var-test1.id

}

resource "tfe_variable" "var-test1-b" {
  key             = "key2"
  value           = "value2"
  category        = "env"
  description     = "env var"
  variable_set_id = tfe_variable_set.var-test1.id

}
