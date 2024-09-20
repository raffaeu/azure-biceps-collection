targetScope = 'subscription'

param location string = 'eastus'
param resourceGroupName string = 'rg-raf'

module rgResource '../core/resource-group.module.bicep' = {
  name: 'rgResourceModule'
  scope: subscription()
  params: {
    location: location
    resourceGroupName: resourceGroupName
  }
}

module storageResource '../core/storage-blob.module.bicep' = {
  name: 'storageResourceModule'
  scope: resourceGroup(resourceGroupName)
  params: {
    location: location
  }
}