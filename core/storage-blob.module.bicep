// StorageAccount
param storageAccountName string = 'rafstorage001'
param location string = 'eastus'
param storageAccountSku string = 'Standard_LRS'
param storageAccountType string = 'StorageV2'
param containerName string = 'rafcontainer'

// Create storage
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSku
  }
  kind: storageAccountType
}

resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2021-06-01' = {
  name: 'default'
  parent: storageAccount
}

// Create containers if specified
resource containers 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-06-01' {
  parent: blobService
  name: containerName
}