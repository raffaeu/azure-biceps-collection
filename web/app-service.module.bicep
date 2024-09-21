param location string = 'eastus'
param appServicePlanName string = 'raf-appservice-plan'
param appServiceAppName string = 'raf-appservice-web'
param linuxFxVersion string = 'node|18-lts' // The runtime stack of web app

resource appServicePlan 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku:  {
  	name: 'B1'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
    httpsOnly: true
  }
}

output appServiceAppHostName string = appServiceApp.properties.defaultHostName
