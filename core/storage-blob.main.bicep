targetScope = 'subscription'

param location string = 'eastus'
param resourceGroupName string = 'rg-raf'

module rgResource 'resource-group.module.bicep' = {
  name: 'rgResourceModule'
  scope: subscription()
  params: {
    location: location
    resourceGroupName: resourceGroupName
  }
}
