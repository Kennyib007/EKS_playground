# Production-Ready EKS Platform

A reusable Amazon EKS platform built with Terraform and operated through Argo CD.

## Repository layout

- `terraform/` provisions AWS networking, IAM, EKS, and Karpenter prerequisites.
- `gitops/` contains Argo CD bootstrap and platform add-on configuration.
- `workloads/` contains sample applications used to validate the platform.
- `docs/` contains architecture, operations, recovery, and decision records.
- `.github/workflows/` contains validation and delivery pipelines.

## First milestone

Provision the development VPC and EKS cluster, bootstrap Argo CD, and expose the demo application through an AWS Application Load Balancer.

Implementation will be added incrementally; placeholder files intentionally mark ownership boundaries without installing controllers prematurely.
