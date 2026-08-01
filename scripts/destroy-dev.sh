#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TF_DIR="$ROOT_DIR/terraform/environments/development"

cd "$TF_DIR"
terraform init -reconfigure -backend-config=backend.hcl
terraform destroy -auto-approve
