# Terraform AWS ECR
Terraform module to create an ECR repository with lifecycle and repository policies
 
## Usage
```hcl
module "ecr" {
  source = "github.com/byu-oit/terraform-aws-ecr?ref=v1.0.1"
  name = "example-app"
}
```

## Inputs
| Name | Description | Default |
| --- | --- | --- |
| name | Repository name | |
| image_tag_mutability | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE | MUTABLE |
| scan_image_on_push | Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false) | true |
| lifecycle_policy | ECR Lifecycle Policy (json string) to manage the image lifecycles in the ECR repository | JSON policy that expires untagged images after 30 days |
| repository_policy | ECR Repository Policy (json string) to manage access to the ECR repository | JSON policy that allows CodeBuild service to pull any image from this ECR repo |
| tags | A map of AWS Tags to attach to each resource created | {} |

## Outputs
| Name | Description |
| --- | --- |
| repository | ECR repository [object](https://www.terraform.io/docs/providers/aws/r/ecr_repository.html#attributes-reference) |
| lifecycle_policy | The repository's lifecycle policy [object](https://www.terraform.io/docs/providers/aws/r/ecr_lifecycle_policy.html#attributes-reference) |
| repository_policy | The repository's repository policy [object](https://www.terraform.io/docs/providers/aws/r/ecr_repository_policy.html#attributes-reference) |