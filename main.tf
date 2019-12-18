
resource "aws_ecr_repository" "repo" {
  name = var.name

  image_tag_mutability = var.image_tag_mutability
  image_scanning_configuration {
    scan_on_push = var.scan_image_on_push
  }

  tags = var.tags
}

resource "aws_ecr_lifecycle_policy" "lifecycle_policy" {
  policy = var.lifecycle_policy
  repository = aws_ecr_repository.repo.name
}
resource "aws_ecr_repository_policy" "repo_policy" {
  policy = var.repository_policy
  repository = aws_ecr_repository.repo.name
}