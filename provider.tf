
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }

  required_version = "~> 1.2.0"
}
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.kubeconfig-certificate-authority-data)
  # client_certificate     = file("~/.kube/client-cert.pem")
  # client_key             = file("~/.kube/client-key.pem")
}

provider "aws" {
  region = var.region
}


resource "random_string" "suffix" {
  length  = 8
  special = false
}
