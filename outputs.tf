output "repository" {
  value = aws_ecr_repository.repo
}

output "lifecycle_policy" {
  value = aws_ecr_lifecycle_policy.lifecycle_policy
}

output "respository_policy" {
  value = aws_ecr_repository_policy.repo_policy
}