provider "aws" {
  region = "us-west-2"
}

module "ecr" {
  source = "github.com/byu-oit/terraform-aws-ecr?ref=v1.0.1"
//  source = "../"
  name = "example-repo"
  image_tag_mutability = "IMMUTABLE"
  lifecycle_policy = <<L_POLICY
{
  "rules": [
    {
      "rulePriority": 10,
      "description": "Keep 10 latest images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": { "type": "expire" }
    }
  ]
}
L_POLICY
}

output "repo_url" {
  value = module.ecr.repository.repository_url
}