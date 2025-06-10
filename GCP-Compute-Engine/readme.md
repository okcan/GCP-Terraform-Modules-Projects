readme:
  filename: README.md
  content: |
    # 🚀 GCP Compute Engine Infrastructure with Terraform

    This project provisions a full Google Cloud Platform (GCP) infrastructure using **Terraform**. It includes:

    - A custom Virtual Private Cloud (VPC)
    - A subnet and firewall rule allowing SSH
    - A service account with basic IAM roles
    - A Compute Engine VM running **Debian** with **Nginx** installed via startup script

    ---

    ## 📁 Project Structure

    ```
    .
    ├── main.tf                # Root configuration
    ├── variables.tf           # Input variables
    ├── outputs.tf             # Output definitions
    ├── terraform.tfvars       # Variable values (e.g., project_id)
    └── modules/
        ├── compute/           # VM and startup script
        ├── iam/               # Service account + IAM roles
        └── network/           # VPC, subnet, firewall
    ```

    ---

    ## ✅ Requirements

    - [Terraform](https://www.terraform.io/downloads.html)
    - [Google Cloud SDK (gcloud)](https://cloud.google.com/sdk)
    - A GCP project with billing enabled
    - Application Default Credentials:

    ```bash
    gcloud auth application-default login
    ```

    ---

    ## ⚙️ Configuration

    Edit `terraform.tfvars` with your project information:

    ```hcl
    project_id = "your-gcp-project-id"
    region     = "us-central1"
    zone       = "us-central1-a"
    ```

    ---

    ## 🧪 Usage

    Initialize and apply:

    ```bash
    terraform init
    terraform apply
    ```

    This will:

    - Create the VPC and subnet
    - Set up SSH access
    - Provision a service account
    - Deploy a VM with Nginx installed

    ---

    ## 🔄 Customization

    You can modify the infrastructure easily:

    | Component     | How to change                                       |
    |---------------|-----------------------------------------------------|
    | VM size       | Edit `machine_type` in `main.tf`                    |
    | Image         | Change boot disk image in `compute/main.tf`         |
    | IAM roles     | Add/edit roles in `iam/main.tf`                     |
    | Firewall rule | Restrict `source_ranges` in `network/main.tf`       |

    ---

    ## 🧹 Cleanup

    To destroy all created resources:

    ```bash
    terraform destroy
    ```

    ---

    ## 📄 License

    This project is provided under the [MIT License](LICENSE).
