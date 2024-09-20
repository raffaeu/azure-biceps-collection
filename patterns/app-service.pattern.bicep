targetScope = 'subscription'

param location string = 'eastus'
param resourceGroupName string = 'rg-raf'

module rgResource '../core/resource-group.module.bicep' = {
  name: 'rgAppResourceModule'
  scope: subscription()
  params: {
    location: location
    resourceGroupName: resourceGroupName
  }
}

module appResource '../web/app-service.module.bicep' = {
  name: 'webResourceModule'
  scope: resourceGroup(resourceGroupName)
  params: {
    location: location
  }
}