variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version to deploy for the EKS control plane. Use 1.27 for broad AWS account/region compatibility."
  type        = string
  default     = "1.27"
}

variable "enable_auto_mode" {
  description = "Explicitly disable EKS Auto Mode for this cluster. Set to true only if your account/region supports it and you want Auto Mode enabled."
  type        = bool
  default     = false
}

variable "subnet_ids" {
  description = "Subnet IDs that the cluster and node group will use."
  type        = list(string)
}

variable "enabled_cluster_log_types" {
  description = "Cluster control plane log types to enable."
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "public_access_cidrs" {
  description = "CIDR blocks allowed to reach the public API endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "node_group_instance_types" {
  description = "Instance types for the managed node group."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_group_desired_size" {
  description = "Desired number of worker nodes."
  type        = number
  default     = 2
}

variable "node_group_min_size" {
  description = "Minimum number of worker nodes."
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "Maximum number of worker nodes."
  type        = number
  default     = 3
}

variable "node_group_disk_size" {
  description = "Disk size for each node in GiB."
  type        = number
  default     = 20
}

variable "node_group_capacity_type" {
  description = "Capacity type for the node group."
  type        = string
  default     = "ON_DEMAND"
}

variable "node_group_ami_type" {
  description = "AMI family to use for the node group."
  type        = string
  default     = "AL2_x86_64"
}

variable "node_group_labels" {
  description = "Labels applied to the managed node group."
  type        = map(string)
  default     = {
    workload = "platform"
  }
}

variable "tags" {
  description = "Extra tags applied to the EKS resources."
  type        = map(string)
  default     = {}
}
