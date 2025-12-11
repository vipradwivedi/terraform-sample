terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "random" {}

locals {
  service_name = "myservice"
  server_count = 5
  environment  = "prod"
  region       = "us-east-1"
  ring         = "ring0"
}

module "workspace" {
  source = "../../../../modules/random"

  server_count = local.server_count
  service_name = local.service_name
  environment  = local.environment
  ring         = local.ring

  generate_new_random_resource = "random1234"
}
output "workspace_names" { value = module.workspace.workspaces }
