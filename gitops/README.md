# GitOps

Argo CD owns the Kubernetes resources under this directory. Terraform should only bootstrap Argo CD and must not manage the same resources.

## Development bootstrap assets

- `bootstrap/argocd-namespace.yaml` creates the Argo CD namespace.
- `bootstrap/argocd-install.yaml` contains the initial repository connection and application definition for the development environment.
- `bootstrap/kustomization.yaml` gathers the bootstrap resources into a single entry point.
