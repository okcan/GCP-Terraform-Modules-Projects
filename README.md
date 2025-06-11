# GCP-Terraform-Modules-Projects

This repository contains a collection of modular and reusable Terraform configurations to build scalable, production-grade infrastructure on **Google Cloud Platform (GCP)**.

---

## 📌 What’s Inside?

A curated set of Terraform modules, each encapsulating a core GCP service:

| Module          | Description                                       |
|-----------------|---------------------------------------------------|
| `network`       | VPC network and subnets                          |
| `compute`       | Instance templates and regional MIGs             |
| `load_balancer` | HTTP(S) load balancer with health checks        |
| `dns`           | Cloud DNS managed zones                          |
| `cloud_sql`     | PostgreSQL Cloud SQL instances                   |
| `storage`       | Google Cloud Storage buckets                     |

---

## 🌍 Why Use This Repository?

- ✅ Production-ready, modular infrastructure
- ✅ Reusable across multiple environments (dev/stage/prod)
- ✅ Follows GCP best practices and naming conventions
- ✅ Clear and minimal inputs/outputs

---

## 🧱 Project Structure

```bash
GCP-Terraform-Modules-Projects/
├── modules/
│   ├── compute/
│   ├── network/
│   ├── load_balancer/
│   ├── dns/
│   ├── cloud_sql/
│   └── storage/
├── examples/
│   └── full-stack-project/   # Full example using all modules
└── README.md
```

---

## 🚀 Getting Started

### 1. Authenticate with Google Cloud
```bash
gcloud auth application-default login
```

### 2. Clone and navigate
```bash
git clone https://github.com/<your-org>/GCP-Terraform-Modules-Projects.git
cd examples/full-stack-project
```

### 3. Customize your `terraform.tfvars`
```hcl
project_id = "your-gcp-project"
region     = "us-central1"
zone       = "us-central1-a"
```

### 4. Deploy
```bash
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

---

## 📎 Notes
- Replace placeholder values in DNS, SQL, and Bucket modules.
- Use environment-specific backends if you're working with Terraform Cloud or remote state.

---

## 📜 License
[MIT](LICENSE)

---

## 🙋 Contributing
PRs and suggestions are welcome! If you’ve found a bug or want to improve a module, feel free to open an issue or submit a pull request.

---

## ✨ Maintained by
[Your Name or Team]

> Built with ❤️ for Terraformers deploying scalable GCP infrastructure.
