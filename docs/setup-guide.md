# Setup Guide for Azure Landing Zone - Data Platform Deployment

This guide provides detailed instructions for setting up the Azure Landing Zone Data Platform environment.

## Prerequisites

Before you begin, ensure you have the following:

- Azure Subscription with Owner permissions
- Azure CLI (version 2.50.0 or higher)
- Terraform (version ~> 1.8)
- Git

## Step-by-Step Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/tnhtnh/alz-platform.git
   cd alz-platform
   ```

2. **Configure Azure CLI**
   Ensure you're logged in to the correct Azure subscription:
   ```bash
   az login
   az account set --subscription <Your-Subscription-ID>
   ```

3. **Run the Setup Script**
   ```bash
   ./setup.sh
   ```
   This script will:
   - Verify prerequisites
   - Set up necessary Azure resources
   - Initialize Terraform

4. **Review and Customize Configuration**
   Open `tenant-config.yaml` and adjust settings as needed for your environment.

5. **Apply Terraform Configuration**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

6. **Verify Deployment**
   Use Azure Portal or Azure CLI to verify that resources have been created correctly.

## Troubleshooting

If you encounter issues during setup:

1. Check the logs in the `logs` directory
2. Ensure all prerequisites are correctly installed
3. Verify your Azure permissions

For further assistance, please contact the platform team.

## Next Steps

After successful setup, refer to the main README for information on making changes and ongoing management of your Azure Landing Zone Data Platform.
