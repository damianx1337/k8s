provider "github" {
  token = "<token>"
  owner = "<name_of_user>"
}

resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"

  visibility = "public"

/*
  template {
    owner                = "<name_of_user>"
    repository           = "terraform-template-module"
    include_all_branches = true
  }
*/
}
