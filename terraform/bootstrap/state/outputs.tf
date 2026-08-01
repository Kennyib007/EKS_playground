output "bucket_name" {
  description = "Name of the S3 state bucket."
  value       = aws_s3_bucket.terraform_state.id
}

output "kms_key_arn" {
  description = "ARN of the KMS key used to encrypt Terraform state."
  value       = aws_kms_key.terraform_state.arn
}

output "kms_alias" {
  description = "KMS alias accepted by the S3 backend configuration."
  value       = aws_kms_alias.terraform_state.name
}
