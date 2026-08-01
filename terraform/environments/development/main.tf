locals {
  cluster_name       = "${var.project_name}-${var.environment}"
  availability_zones = slice(data.aws_availability_zones.available.names, 0, 3)
  common_tags = merge(var.tags, {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
  })
}

module "network" {
  source = "../../modules/network"

  name               = "${local.cluster_name}-vpc"
  cluster_name       = local.cluster_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = local.availability_zones
  single_nat_gateway = var.single_nat_gateway
  enable_flow_logs   = var.enable_flow_logs
  tags               = local.common_tags
}

module "eks" {
  source = "../../modules/eks"

  cluster_name = local.cluster_name
  subnet_ids   = concat(module.network.public_subnet_ids, module.network.private_subnet_ids)
  tags         = local.common_tags
}
