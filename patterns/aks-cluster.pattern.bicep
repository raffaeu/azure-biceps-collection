targetScope = 'subscription'

param location string = 'eastus'
param resourceGroupName string = 'rg-raf'

module rgResource '../core/resource-group.module.bicep' = {
  name: 'rgAksResourceModule'
  scope: subscription()
  params: {
    location: location
    resourceGroupName: resourceGroupName
  }
}
