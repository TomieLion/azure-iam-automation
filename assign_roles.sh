#!/bin/bash
# file: assign_roles.sh

RG_NAME="IAM-Automation-Project-RG"
VNET_NAME="SecureVNet"
DB_SUBNET="DBSubnet"

# 1. Get the Resource ID of the DB Subnet
echo "Fetching DB Subnet Resource ID..."
SUB_ID=$(az network vnet subnet show \
  --resource-group $RG_NAME \
  --vnet-name $VNET_NAME \
  --name $DB_SUBNET \
  --query id --output tsv)

# 2. Get the Object ID of the DBAdmins Group
echo "Fetching DBAdmins Group ID..."
GROUP_ID=$(az ad group show --group "DBAdmins" --query id --output tsv)

# 3. Assign the 'Reader' Role
echo "Assigning Reader role to DBAdmins for the DB Subnet..."
az role assignment create \
  --assignee $GROUP_ID \
  --role "Reader" \
  --scope $SUB_ID

echo "Role assignment complete!"