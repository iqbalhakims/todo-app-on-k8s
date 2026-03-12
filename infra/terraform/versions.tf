terraform {
  required_version = ">= 1.0"

  cloud {
    organization = "iqbal-hakim"

    workspaces {
      name = "todo-on-k8s"
    }
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}
