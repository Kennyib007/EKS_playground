variable "name" {
  description = "Name prefix for network resources."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The network name must not be empty."
  }
}

variable "cluster_name" {
  description = "EKS cluster name used for subnet discovery tags."
  type        = string
}

variable "vpc_cidr" {
  description = "IPv4 CIDR assigned to the VPC."
  type        = string
  default     = "10.20.0.0/16"

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "The VPC CIDR must be a valid IPv4 CIDR."
  }
}

variable "availability_zones" {
  description = "Three availability zones used by the VPC."
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) == 3
    error_message = "Exactly three availability zones must be supplied."
  }
}

variable "single_nat_gateway" {
  description = "Use one shared NAT gateway instead of one per availability zone."
  type        = bool
  default     = true
}

variable "enable_flow_logs" {
  description = "Send VPC flow logs to CloudWatch Logs."
  type        = bool
  default     = false
}

variable "flow_log_retention_days" {
  description = "CloudWatch retention period for VPC flow logs."
  type        = number
  default     = 30
}

variable "tags" {
  description = "Additional tags applied to network resources."
  type        = map(string)
  default     = {}
}
