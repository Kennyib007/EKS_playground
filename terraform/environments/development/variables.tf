variable "aws_region" {
  description = "AWS Region in which the development platform is deployed."
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Name used to identify platform resources."
  type        = string
  default     = "eks-platform"
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "development"
}

variable "vpc_cidr" {
  description = "IPv4 CIDR assigned to the development VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "single_nat_gateway" {
  description = "Use one NAT gateway to reduce development cost."
  type        = bool
  default     = true
}

variable "enable_flow_logs" {
  description = "Enable development VPC flow logs."
  type        = bool
  default     = false
}

variable "cluster_version" {
  description = "Kubernetes version for the development EKS cluster."
  type        = string
  default     = "1.34"
}

variable "enable_auto_mode" {
  description = "Explicitly enable EKS Auto Mode. Leave false for the standard managed node group deployment."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags applied to development resources."
  type        = map(string)
  default     = {}
}
