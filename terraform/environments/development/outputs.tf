output "vpc_id" {
  description = "ID of the development VPC."
  value       = module.network.vpc_id
}

output "availability_zones" {
  description = "Availability zones selected for development."
  value       = module.network.availability_zones
}

output "public_subnet_ids" {
  description = "Public subnet IDs for internet-facing load balancers."
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs for EKS nodes and workloads."
  value       = module.network.private_subnet_ids
}

output "cluster_name" {
  description = "Name of the development EKS cluster."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint of the development EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Certificate authority data for kubectl access to the development EKS cluster."
  value       = module.eks.cluster_certificate_authority_data
}
