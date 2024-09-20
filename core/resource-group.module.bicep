targetScope = 'rg-raf'

// Parameters
param resourceGroupName string = 'myResourceGroup'
param location string = 'easteurope'

// Define the resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}
