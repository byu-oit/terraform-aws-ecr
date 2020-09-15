provider "aws" {
  region = "us-west-2"
}

module "ecr" {
  //  source = "github.com/byu-oit/terraform-aws-ecr?ref=v2.0.1"
  source = "../../"
  name   = "example-repo"
}

output "repo_url" {
  value = module.ecr.repository.repository_url
}
