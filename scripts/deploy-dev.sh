#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TF_DIR="$ROOT_DIR/terraform/environments/development"

cd "$TF_DIR"
terraform init -backend=false
terraform plan -out=tfplan
terraform apply -auto-approve tfplan

echo "Terraform apply complete."
echo "Next: install Argo CD and apply the bootstrap manifests in gitops/bootstrap."
