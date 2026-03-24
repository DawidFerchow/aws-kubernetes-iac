# aws-kubernetes-iac

Infrastructure as Code project that provisions a Kubernetes cluster on AWS using Terraform and configures it using Ansible.

This repository demonstrates a DevOps workflow including:

- Terraform infrastructure provisioning
- Ansible configuration management
- Kubernetes cluster bootstrap
- Observability stack
- GitHub Actions CI/CD

## Terraform provisioning

The infrastructure is provisioned using Terraform. The project follows a modular structure, where the root module is located in `infra/envs/dev` and composes reusable modules for networking, security, and compute resources.

### Prerequisites

Before running Terraform, ensure you have:

- AWS credentials configured (`aws configure`)
- An existing SSH key pair in AWS
- A valid AMI ID for your selected region

### Initialization

Initialize the Terraform working directory and download the required providers:

```bash
cd infra/envs/dev
terraform init
```

### Plan

Preview the infrastructure changes:

```bash
terraform plan
```

This command shows what resources will be created, modified, or destroyed without applying the changes.

### Apply

Provision the infrastructure:

```bash
terraform apply
```

Confirm the execution when prompted. After completion, Terraform will output key information such as:

* control plane public and private IP
* worker nodes public and private IPs

These outputs are later used to generate Ansible inventory and bootstrap the Kubernetes cluster.

### Destroy (optional)

To remove all provisioned resources:

```bash
terraform destroy
```

### Infrastructure overview

The provisioned infrastructure includes:

* VPC with public subnets
* Security group for Kubernetes nodes
* EC2 instances (1 control plane, 2 worker nodes)