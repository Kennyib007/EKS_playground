#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TF_DIR="$ROOT_DIR/terraform/environments/development"

cd "$TF_DIR"
echo "Using Terraform variables from terraform.tfvars"
echo "Cluster version override: $(grep -E '^cluster_version' terraform.tfvars | head -n 1 || true)"
terraform init -upgrade -reconfigure -backend-config=backend.hcl
terraform plan -var='enable_auto_mode=false' -out=tfplan

echo "Terraform plan complete. Review it above before applying."
read -r -p "Apply these changes now? [y/N] " response
case "$response" in
  [yY][eE][sS]|[yY])
    terraform apply -auto-approve tfplan
    echo "Terraform apply complete."
    echo "Next: install Argo CD and apply the bootstrap manifests in gitops/bootstrap."
    ;;
  *)
    echo "Apply cancelled. No changes were made."
    ;;
esac
