![Latest GitHub Release](https://img.shields.io/github/v/release/byu-oit/terraform-aws-ecr?sort=semver)

# Terraform AWS ECR
Terraform module to create an ECR repository with lifecycle and repository policies
 
## Usage
```hcl
module "ecr" {
  source = "github.com/byu-oit/terraform-aws-ecr?ref=v2.0.0"
  name   = "example-app"
}
```

## Requirements
* Terraform version 0.12.16 or greater

## Inputs
| Name | Type | Description | Default |
| --- | --- | --- | --- |
| name | string | Repository name | |
| image_tag_mutability | string | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE | IMMUTABLE |
| scan_image_on_push | boolean | Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false) | true |
| lifecycle_policy | string | ECR Lifecycle Policy (json string) to manage the image lifecycles in the ECR repository | JSON policy that only keeps latest 100 images |
| repository_policy | string | ECR Repository Policy (json string) to manage access to the ECR repository | JSON policy that allows CodeBuild service to pull any image from this ECR repo |
| tags | map(string) | A map of AWS Tags to attach to each resource created | {} |

## Outputs
| Name | Type | Description |
| --- | --- | --- |
| repository | [object](https://www.terraform.io/docs/providers/aws/r/ecr_repository.html#attributes-reference) | ECR repository object |
| lifecycle_policy | [object](https://www.terraform.io/docs/providers/aws/r/ecr_lifecycle_policy.html#attributes-reference) | The repository's lifecycle policy object |
| repository_policy | [object](https://www.terraform.io/docs/providers/aws/r/ecr_repository_policy.html#attributes-reference) | The repository's repository policy object | 
