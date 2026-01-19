# Copilot Instructions for Terraform AWS Infrastructure

## Project Overview
This is a modular Terraform project for provisioning AWS infrastructure components for a Kubernetes cluster, focusing on VPC networking and security groups.

## Architecture
- **Modules**: Reusable components in subdirectories (e.g., `a1_vpc/`, `b1_security_group/`)
- **Environment Configuration**: Environment-specific setups in `env/{environment}/` (e.g., `env/prod/`)
- **Data Flow**: Configuration passed via `globals` variable object containing environment, project, CIDR blocks, names, and tags
- **Dependencies**: Security group module references VPC module outputs for VPC ID

## Key Patterns
- **Global Configuration**: Use `globals` object for shared variables (environment, project, network settings, tags)
- **Resource Naming**: Tags include `Name` with pattern `${resource_name}-${environment}`
- **Security**: Open security group rules for Kubernetes (SSH:22, API:6443, all internal traffic, full outbound)
- **Modular Structure**: Each module has `main.tf`, `outputs.tf`, `variables.tf` (note: some files misspelled as `varaibles.tf`)

## Workflows
- **Initialization**: Run `terraform init` in environment directory (e.g., `env/prod/`)
- **Planning**: `terraform plan -var-file=terraform.tfvars` to preview changes
- **Deployment**: `terraform apply -auto-approve` for automated deployment
- **State Management**: Local state files; back up `terraform.tfstate.backup`

## Conventions
- **Provider**: AWS provider v6.28.0, region us-east-1
- **Tags**: Mandatory `owner` and `team` tags on all resources
- **Module Prefixes**: Modules prefixed with letters/numbers (e.g., `a1_`, `b1_`) for ordering
- **Variable Files**: Use `terraform.tfvars` for environment-specific values

## Examples
- Reference VPC ID: `module.vpc.vpc_id`
- Tag resources: `tags = { Name = "${var.globals.vpc_1_name}-${var.globals.environment}" }`</content>
<parameter name="filePath">C:\MLOps_V2\terraform\docker_aws_eye\.github\copilot-instructions.md