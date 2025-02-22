terraform {
  cloud {

    organization = "david-org"
    hostname     = "app.terraform.io"

    workspaces {
      name = "david-vpc"
    }
  }
}