#!/bin/bash

# Setup script for Azure Landing Zone - Data Platform Deployment

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check prerequisites
echo "Checking prerequisites..."

if ! command_exists az; then
    echo "Azure CLI is not installed. Please install it and try again."
    exit 1
fi

if ! command_exists terraform; then
    echo "Terraform is not installed. Please install it and try again."
    exit 1
fi

# Ensure Azure CLI is logged in
echo "Checking Azure CLI login status..."
az account show >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "You are not logged in to Azure CLI. Please log in."
    az login
fi

# Select subscription
echo "Please enter your Azure Subscription ID:"
read subscription_id
az account set --subscription $subscription_id

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

# Verify tenant-config.yaml exists
if [ ! -f "tenant-config.yaml" ]; then
    echo "tenant-config.yaml not found. Please create this file with your configuration."
    exit 1
fi

echo "Setup complete. You can now customize tenant-config.yaml and run Terraform commands."
echo "Next steps:"
echo "1. Review and edit tenant-config.yaml as needed"
echo "2. Run 'terraform plan' to preview changes"
echo "3. Run 'terraform apply' to deploy resources"
