terraform {
  required_providers {
    gcp = {
      source  = "hashicorp/google"
      version = "~> 3.67.0"
    }
  }
  backend "remote" {
    organization = "TeraSky"

    workspaces {
      name = "gcp-kuma-sm"
    }
  }
}

provider "google" {
  project     = "skywiz-sandbox"
}
