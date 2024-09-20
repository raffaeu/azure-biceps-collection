targetScope = 'subscription'

param location string = 'eastus'
param resourceGroupName string = 'rg-raf'

module rgResource 'resource-group.module.bicep' = {
  name: 'rgResourceModule'
  params: {
    location: location
    resourceGroupName: resourceGroupName
  }
}
