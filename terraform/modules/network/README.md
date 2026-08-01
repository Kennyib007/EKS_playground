# Network module

Creates an EKS-ready VPC across exactly three availability zones with public load-balancer subnets, private worker subnets, internet routing, configurable NAT topology, Kubernetes discovery tags, and optional VPC flow logs.

The module derives six `/20` subnets from the supplied `/16` by default. Development uses one NAT gateway; resilient environments can set `single_nat_gateway = false` to deploy one NAT gateway per availability zone.
