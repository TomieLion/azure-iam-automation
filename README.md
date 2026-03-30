# Azure IAM & Secure Access Automation 🚀

## 📌 Project Overview
This project automates the deployment of a secure Azure networking environment using **Azure CLI** and **Bash scripting**. It implements **Role-Based Access Control (RBAC)** to enforce the **Principle of Least Privilege (PoLP)**, ensuring that users only have the permissions necessary for their specific roles.

The entire workflow is automated via a **CI/CD pipeline** using GitHub Actions, demonstrating a "Security-as-Code" approach.

---

## 🏗️ Architecture
The automation script provisions the following resources:
* **Resource Group:** Centralized container for all project resources.
* **Virtual Network (VNet):** A private, isolated network environment.
* **Subnets:** * `WebSubnet`: For frontend/web tier resources.
    * `DBSubnet`: For sensitive database tier resources.
* **Identity Groups (Entra ID):**
    * `WebAdmins`: Managed access for web infrastructure.
    * `DBAdmins`: Specifically scoped access to database resources.

---

## 🔐 Security Implementation
* **RBAC Scoping:** Instead of broad subscription-level access, the `DBAdmins` group is granted the **Reader** role specifically at the `DBSubnet` resource scope.
* **Automated Identity Management:** Groups are created and managed via script to ensure consistency and eliminate manual configuration errors.
* **Service Principal Authentication:** GitHub Actions connects to Azure using a dedicated Service Principal with scoped permissions.

---

## 🚀 CI/CD Pipeline
The project includes a GitHub Actions workflow (`.github/workflows/deploy.yml`) that:
1. **Triggers** on every push to the `main` branch.
2. **Authenticates** securely to Azure using GitHub Secrets.
3. **Executes** the deployment scripts in a clean Ubuntu environment.
4. **Validates** role assignments automatically.

---

## 🛠️ How to Use

### Prerequisites
* Azure CLI installed locally.
* A GitHub account and an Azure Subscription.

### Deployment
1. Clone the repository.
2. Run the setup script locally:
   ```bash
   chmod +x setup.sh assign_roles.sh
   ./setup.sh
   ./assign_roles.sh