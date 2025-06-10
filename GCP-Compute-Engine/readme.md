# GCP Compute Engine Terraform Infrastructure

This Terraform project provisions a complete Google Cloud Platform (GCP) infrastructure including:

- A custom Virtual Private Cloud (VPC)
- Subnet and firewall rules (SSH access)
- A service account with logging and monitoring roles
- A Compute Engine virtual machine running Debian with Nginx


## 🚀 Getting Started

### 1. Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- Google Cloud CLI (`gcloud`)
- An active GCP project with billing enabled
- Application Default Credentials:

```bash
gcloud auth application-default login
2. Configure Variables
Edit terraform.tfvars with your project details:

hcl
Copy
Edit
project_id = "your-gcp-project-id"
region     = "us-central1"
zone       = "us-central1-a"
3. Initialize Terraform
bash
Copy
Edit
terraform init
4. Apply the Infrastructure
bash
Copy
Edit
terraform apply
Confirm the plan to create the infrastructure.

💡 Features
Modular design: Code is split into reusable modules (network, iam, compute)

Service account: Includes minimal IAM roles for monitoring/logging

Secure access: SSH allowed from all IPs (adjustable)

Startup script: Installs Nginx automatically

🔧 Customization
You can modify these aspects easily:

VM specs: Change machine_type in main.tf

Image: Edit initialize_params.image in compute/main.tf

Firewall rules: Update network/main.tf to restrict access

IAM roles: Customize in iam/main.tf as needed

🧹 Cleanup
To remove all resources created:

bash
Copy
Edit
terraform destroy
📝 License
This project is open-source and available under the MIT License.

📬 Questions?
Feel free to open an issue or contact the project maintainer.

yaml
Copy
Edit

---

Let me know if you’d like this README rendered with badges, contributor sections, or converted to `.md` and zipped with your code.
