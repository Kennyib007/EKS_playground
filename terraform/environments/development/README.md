# Development environment

The development Terraform root now provisions the network foundation and includes the EKS module needed for the first milestone.

## Progress checker

### Infrastructure
- [x] Network foundation and subnets are defined.
- [x] EKS cluster and managed node group module are available.
- [ ] Apply Terraform to create the development VPC, EKS cluster, and worker nodes.

### GitOps and platform bootstrap
- [x] Bootstrap documentation exists for Argo CD.
- [ ] Install Argo CD in the development cluster.
- [ ] Connect the repository and sync platform add-ons.

### Demo workload and ingress
- [x] Demo workload manifests and an ingress definition are present.
- [ ] Apply the demo workload to the cluster.
- [ ] Validate the ingress path and confirm external traffic reaches the workload.

## Initialize

1. Apply `terraform/bootstrap/state` once in the target AWS account.
2. Copy `backend.hcl.example` to `backend.hcl` and replace `ACCOUNT_ID` with your AWS account ID, or use the repository example file as a starting point.
3. Copy `terraform.tfvars.example` to `terraform.tfvars` and review its values.
4. Run `terraform init -backend-config=backend.hcl`.
5. Review `terraform plan` before applying.
6. Apply `terraform apply` to create the development VPC and EKS cluster.
7. Optionally use `scripts/deploy-dev.sh` as a convenience wrapper for the Terraform apply flow.

## Operational notes

- Development defaults to one NAT gateway to reduce cost. Set `single_nat_gateway = false` when zonal NAT resilience is required.
- The demo workload and ingress manifests are intended to be applied after the cluster is provisioned and Argo CD is reachable.
- For a full live-environment test, run `scripts/deploy-dev.sh` to apply the stack and `scripts/destroy-dev.sh` to remove it again with Terraform destroy.
