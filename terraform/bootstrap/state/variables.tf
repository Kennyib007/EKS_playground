variable "aws_region" {
  description = "AWS Region that stores the Terraform state."
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Name used to construct state infrastructure names."
  type        = string
  default     = "eks-platform"
}

variable "noncurrent_version_expiration_days" {
  description = "Number of days to retain noncurrent state object versions."
  type        = number
  default     = 90

  validation {
    condition     = var.noncurrent_version_expiration_days >= 30
    error_message = "Noncurrent state versions must be retained for at least 30 days."
  }
}

variable "tags" {
  description = "Tags applied to all state infrastructure."
  type        = map(string)
  default = {
    Environment = "shared"
    ManagedBy   = "Terraform"
    Project     = "eks-platform"
  }
}
