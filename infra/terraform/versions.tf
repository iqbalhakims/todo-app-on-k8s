terraform {
  required_version = ">= 1.0"

  cloud {
    organization = "iqbal-hakim"

    workspaces {
      name = "todo-app-on-k8s"
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
  # token is read from DIGITALOCEAN_TOKEN environment variable
}
