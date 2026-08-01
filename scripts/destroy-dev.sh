#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TF_DIR="$ROOT_DIR/terraform/environments/development"

cd "$TF_DIR"
terraform init -upgrade -reconfigure -backend-config=backend.hcl
terraform plan -destroy -var='enable_auto_mode=false' -out=tfplan-destroy

echo "Terraform destroy plan complete. Review it above before proceeding."
read -r -p "Destroy these resources now? [y/N] " response
case "$response" in
  [yY][eE][sS]|[yY])
    terraform apply -auto-approve tfplan-destroy
    echo "Terraform destroy complete."
    ;;
  *)
    echo "Destroy cancelled. No changes were made."
    ;;
esac
