targetScope = 'subscription'

param location string = 'eastus'
param resourceGroupName string = 'rg-raf'
param linuxAdminUsername string
param sshRSAPublicKey string

module rgResource '../core/resource-group.module.bicep' = {
  name: 'rgAksResourceModule'
  scope: subscription()
  params: {
    location: location
    resourceGroupName: resourceGroupName
  }
}

module appResource '../containers/aks-cluster.module.bicep' = {
  name: 'aksResourceModule'
  scope: resourceGroup(resourceGroupName)
  dependsOn: [rgResource]
  params: {
    location: location
    linuxAdminUsername: linuxAdminUsername
    sshRSAPublicKey: sshRSAPublicKey
  }
}
