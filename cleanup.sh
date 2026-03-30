#!/bin/bash
RG_NAME="IAM-Automation-Project-RG"

echo "Deleting Resource Group and all contained resources..."
az group delete --name $RG_NAME --yes --no-wait

echo "Deleting AD Groups..."
az ad group delete --group "WebAdmins"
az ad group delete --group "DBAdmins"

echo "Cleanup initiated!"