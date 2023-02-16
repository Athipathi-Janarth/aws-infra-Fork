# aws-infra

Infrastructure creates a public VPC, three public subnets, internet gateway and route table for subnets on top of AMI from packer

## `Steps to create a VPC`

- Run command  `tf plan -var-file="dev-variables.tfvars"`

- Run command  `tf apply -var-file="dev-variables.tfvars"`

## `Steps to delete a VPC`

- Run command  `tf destroy -var-file="dev-variables.tfvars"`