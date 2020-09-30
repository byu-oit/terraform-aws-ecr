terraform {
  required_version = "0.12.26"
}

provider "aws" {
  version = "~> 3.0"
  region  = "us-west-2"
}

module "ecr" {
  source = "../../"
  name   = "example-repo"
}

output "repository" {
  value = module.ecr.repository
}

output "lifecycle_policy" {
  value = module.ecr.lifecycle_policy
}

output "repository_policy" {
  value = module.ecr.repository_policy
}
