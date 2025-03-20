#!/bin/bash

BE_RESOURCE_GROUP="tf-backend-rg"
STORAGE_ACCOUNT="tfbackend$RANDOM"
CONTAINER_NAME="tfstate"
LOCATION="germanywestcentral"

az group create --name $BE_RESOURCE_GROUP --location $LOCATION

az storage account create --name $STORAGE_ACCOUNT --resource-group $BE_RESOURCE_GROUP --location $LOCATION --sku Standard_LRS --encryption-services blob

ACCOUNT_KEY=$(az storage account keys list --resource-group $BE_RESOURCE_GROUP --account-name $STORAGE_ACCOUNT --query '[0].value' --output tsv)

az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT --account-key $ACCOUNT_KEY

echo "Storage Account Name: $STORAGE_ACCOUNT"
echo "Resource Group: $BE_RESOURCE_GROUP"
echo "Container Name: $CONTAINER_NAME"

echo "STORAGE_ACCOUNT=$STORAGE_ACCOUNT" >> $GITHUB_ENV
echo "RESOURCE_GROUP=$BE_RESOURCE_GROUP" >> $GITHUB_ENV
echo "CONTAINER_NAME=$CONTAINER_NAME" >> $GITHUB_ENV
echo "ACCOUNT_KEY=$ACCOUNT_KEY" >> $GITHUB_ENV