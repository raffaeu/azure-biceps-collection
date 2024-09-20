targetScope = 'subscription'

// Parameters
param resourceGroupName string = 'rg-raf'
param location string = 'eastus'

// Define the resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}
