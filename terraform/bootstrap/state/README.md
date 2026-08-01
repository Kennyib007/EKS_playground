# Terraform state bootstrap

This root creates the S3 bucket and KMS key used by the other Terraform roots. It intentionally starts with local state because the remote backend does not exist yet.

## Usage

1. Authenticate to the target AWS account.
2. Copy `terraform.tfvars.example` to `terraform.tfvars` and review the tags.
3. Run `terraform init`, `terraform plan`, and `terraform apply` from this directory.
4. Use the outputs to populate each environment's private `backend.hcl` file.

The bucket uses S3-native state locking. DynamoDB locking is not required.
