variable "name" {
  type = string
  description = "Repository name."
}

variable "image_tag_mutability" {
  type = string
  description = "The tag mutability setting for the repository"
  default = "MUTABLE"
}
variable "scan_image_on_push" {
  type = bool
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)"
  default = true
}
variable "lifecycle_policy" {
  type = string
  description = "ECR Lifecycle Policy (json string) to manage the image lifecycles in the ECR repository. Defaults to expire untagged images after 30 days."
  default = <<L_POLICY
{
  "rules": [
    {
      "rulePriority": 10,
      "description": "Expire untagged images after 30 days",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 30
      },
      "action": { "type": "expire" }
    }
  ]
}
L_POLICY
}
variable "repository_policy" {
  type = string
  description = "ECR Repository Policy (json string) to manage access to the ECR repository. Defaults to allow CodeBuild service to pull any image from this ECR repo."
  default = <<R_POLICY
{
  "Version": "2008-10-17",
  "Statement": [
	{
	  "Sid": "pull",
	  "Effect": "Allow",
	  "Principal": {
		"Service": "codebuild.amazonaws.com"
	  },
	  "Action": [
		"ecr:GetDownloadUrlForLayer",
		"ecr:BatchGetImage",
		"ecr:BatchCheckLayerAvailability"
	  ]
	}
  ]
}
R_POLICY
}
variable "tags" {
  type = map(string)
  description = "Tags to attach to Fargate service and task definition and other resources. Defaults to {}"
  default = {}
}