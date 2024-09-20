targetScope = 'subscription'

// Parameters
param resourceGroupName string = 'myResourceGroup'
param storageAccountName string = 'mystorageaccount'
param containerName string = 'mycontainer'
param location string = 'easteurope'

// Define the resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

// Define the storage account
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: rg.location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

// Define the blob service
resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2021-04-01' = {
  name: 'default'
  parent: storageAccount
  properties: {}
}

// Define a container in the blob service
resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  name: containerName
  parent: blobService
  properties: {
    publicAccess: 'None'
  }
}

