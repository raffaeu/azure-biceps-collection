targetScope = 'subscription'

param location string = 'eastus'
param resourceGroupName = 'rg-raf'

module rgResource 'resource-group.module.bicep' = {
  name: 'rgResourceModule'
  scope: resourceGroup(resourceGroupName)
  params: {
    location: location
    resourceGroupName: resourceGroupName
  }
}
