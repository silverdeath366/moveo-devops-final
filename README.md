# NGINX Terraform Deployment (Secure & Automated)

This project sets up a secure AWS infrastructure using Terraform to deploy a Dockerized NGINX instance on a private EC2 instance. It includes a VPC with public/private subnets, NAT Gateway, SSM access, and Docker container pull from DockerHub.

---

## 🏗️nfrastructure Overview

-  VPC with Public + Private Subnets
-  NAT Gateway for outbound internet from private subnet
-  EC2 instance (Ubuntu) in **private subnet**
-  Docker installed via user-data
-  Pulls custom image `silverdeath366/my-nginx` from DockerHub
-  Accessed via AWS Session Manager (no public IP needed)
-  Secure: No secrets hardcoded

---

##  Secrets & Security

All secrets are injected securely using **environment variables**:

```bash
export TF_VAR_aws_access_key="YOUR_ACCESS_KEY"
export TF_VAR_aws_secret_key="YOUR_SECRET_KEY"
```

This prevents credentials from being stored in code or version control.

---

##  How to Use

### 1. Clone the repository
```bash
git clone https://github.com/YOUR_USERNAME/nginx-terraform.git
cd nginx-terraform
```

### 2. Export AWS Credentials
```bash
export TF_VAR_aws_access_key="YOUR_ACCESS_KEY"
export TF_VAR_aws_secret_key="YOUR_SECRET_KEY"
```

### 3. Generate SSH Key
```bash
mkdir -p keys
ssh-keygen -t rsa -b 4096 -f keys/nginx_key -N ""
```

> Public key will be auto-used by Terraform

### 4. Initialize Terraform
```bash
terraform init
```

### 5. Apply Infrastructure
```bash
terraform apply -auto-approve
```

### 6. Access EC2 (via SSM)
Use AWS Console > Systems Manager > Session Manager

Once inside:
```bash
curl localhost
```
You should see: `yo this is nginx`

---

##  Example `terraform.tfvars` (optional)

Not committed to GitHub for security.

```hcl
region          = "us-east-1"
public_key_path = "keys/nginx_key.pub"
```

---

##  Teardown

```bash
terraform destroy -auto-approve
```

---

##  Bonus Features Ready

- GitHub Actions compatible (but optional for now)
- Secrets ready for CI/CD via GitHub Environments

---

##  Reminder

- `terraform.tfvars` is `.gitignore`d
- NEVER hardcode secrets in Terraform files
- Use IAM roles and SSM wherever possible

---

# Trigger Workflow
# Trigger Workflow2
# Trigger Workflow3
