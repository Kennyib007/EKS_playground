# Production-Ready EKS Platform

A reusable Amazon EKS platform built with Terraform and operated through Argo CD.

## Repository layout

- `terraform/` contains the infrastructure code and modules for AWS networking, IAM, EKS, and Karpenter.
- `gitops/` contains Argo CD bootstrap and platform add-on configuration.
- `workloads/` contains sample applications used to validate the platform.
- `scripts/` contains helper scripts for provisioning and deployment.
- `.github/` contains workflow assets for validation and delivery.

## Current focus

The immediate milestone is to provision the development VPC and EKS cluster, bootstrap Argo CD, and expose the demo application through an AWS Application Load Balancer.

The repository is intentionally kept lean: Terraform handles infrastructure, Argo CD handles Kubernetes resources, and workload validation lives in the sample manifests and overlays.

## Development notes

Use the development environment guide in `terraform/environments/development/README.md` for the current progress checklist and deployment steps.
