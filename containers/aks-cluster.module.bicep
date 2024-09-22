/*
Create an SSH key pair using Azure CLI
az sshkey create --name "mySSHKey" --resource-group "myResourceGroup"

Create an SSH key pair using ssh-keygen
ssh-keygen -t rsa -b 4096
*/

param clusterName string = 'aks01cluster'
param location string = 'eastus'
param agentVMSize string = 'standard_d2s_v3'
param linuxAdminUsername string
param sshRSAPublicKey string

@minValue(0)
@maxValue(1023)
param osDiskSizeGB int = 0

@minValue(1)
@maxValue(50)
param agentCount int = 3

resource aks 'Microsoft.ContainerService/managedClusters@2024-02-01' = {
  name: clusterName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    agentPoolProfiles: [
      {
        name: 'agentpool'
        osDiskSizeGB: osDiskSizeGB
        count: agentCount
        vmSize: agentVMSize
        osType: 'Linux'
        mode: 'System'
      }
    ]
    linuxProfile: {
      adminUsername: linuxAdminUsername
      ssh: {
        publicKeys: [
          {
            keyData: sshRSAPublicKey
          }
        ]
      }
    }
  }
}

output controlPlaneFQDN string = aks.properties.fqdn
