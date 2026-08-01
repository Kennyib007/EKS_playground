# Terraform

Reusable modules live in `modules/`. Deployable root configurations live in `environments/`.

Each environment should use remote state and call versioned modules. Do not place credentials or secret values in this repository.
