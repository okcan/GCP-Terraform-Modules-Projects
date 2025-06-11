# GCP Infrastructure as Code with Terraform

This repository contains a modular Terraform project to deploy a full infrastructure setup on Google Cloud Platform (GCP).

---

## 📊 Architecture Diagram

This diagram outlines how users interact with GCP services including DNS, load balancing, autoscaling Compute Engine instances, Cloud SQL, and Cloud Storage.

---

## 📦 Features

- ✅ VPC network & subnet creation
- ✅ Compute Engine instance group (with Ubuntu image)
- ✅ HTTP Load Balancer
- ✅ Cloud Storage bucket
- ✅ Cloud SQL instance (PostgreSQL)
- ✅ DNS managed zone (customizable)
- ✅ Custom service account
- ✅ Modular Terraform structure

---

## 🧱 Project Structure

```bash
.
├── main.tf                  # Root module: connects all sub-modules
├── terraform.tfvars         # Environment-specific variable values
└── modules/
    ├── network/             # VPC + subnet
    ├── compute/             # Instance template + group
    ├── load_balancer/       # LB, health checks, backend config
    ├── dns/                 # DNS zone
    ├── cloud_sql/           # PostgreSQL instance
    └── storage/             # Cloud Storage bucket
```

---

## ⚙️ Setup Instructions

### 1. Authenticate with GCP
```bash
gcloud auth application-default login
```

> Alternatively, export a service account key:
```bash
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/key.json"
```

### 2. Clone and Navigate
```bash
git clone <repo-url>
cd <project-folder>
```

### 3. Customize Variables
Edit the `terraform.tfvars` file:
```hcl
project_id = "your-gcp-project-id"
region     = "us-central1"
zone       = "us-central1-a"
```

> **Optional:** Update `domain` and `zone_name` inside `main.tf` to reflect your real DNS setup.

### 4. Initialize & Apply Terraform
```bash
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

---

## 🚨 Notes
- Make sure your account has the required IAM permissions
- `example.com.` in DNS is a placeholder → replace it with your actual domain
- Cloud SQL & DNS require elevated permissions and may trigger 2FA on first use

---

## 📜 License
MIT License

---

## 🤝 Contributing
Feel free to open issues or PRs for improvements or bug fixes.

---

## 🧑‍💻 Maintainer
This project was generated with ❤️ by [your-name].
