#!/bin/bash
# file: setup_iam_infra.sh

# 1. Variables - Change these to suit your naming preference
RG_NAME="IAM-Automation-Project-RG"
LOCATION="eastus"
VNET_NAME="SecureVNet"
WEB_SUBNET="WebSubnet"
DB_SUBNET="DBSubnet"

# 2. Create Resource Group
echo "Creating Resource Group: $RG_NAME..."
az group create --name $RG_NAME --location $LOCATION

# 3. Create VNet and Subnets
echo "Creating VNet and Web Subnet..."
az network vnet create \
  --resource-group $RG_NAME \
  --name $VNET_NAME \
  --address-prefix 10.0.0.0/16 \
  --subnet-name $WEB_SUBNET \
  --subnet-prefix 10.0.1.0/24

echo "Creating DB Subnet..."
az network vnet subnet create \
  --resource-group $RG_NAME \
  --vnet-name $VNET_NAME \
  --name $DB_SUBNET \
  --address-prefix 10.0.2.0/24

# 4. Create Entra ID (Azure AD) Groups
echo "Creating AD Groups: WebAdmins and DBAdmins..."
az ad group create --display-name "WebAdmins" --mail-nickname "WebAdmins"
az ad group create --display-name "DBAdmins" --mail-nickname "DBAdmins"

echo "Infrastructure and Groups created successfully!"