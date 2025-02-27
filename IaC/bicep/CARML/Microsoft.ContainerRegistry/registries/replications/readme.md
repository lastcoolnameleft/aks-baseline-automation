# ContainerRegistry Registries Replications `[Microsoft.ContainerRegistry/registries/replications]`

This module deploys ContainerRegistry Registries Replications.

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.ContainerRegistry/registries/replications` | 2021-12-01-preview |

## Parameters

| Parameter Name | Type | Default Value | Possible Values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `cuaId` | string |  |  | Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered |
| `location` | string | `[resourceGroup().location]` |  | Optional. Location for all resources. |
| `name` | string |  |  | Required. The name of the replication. |
| `regionEndpointEnabled` | bool | `True` |  | Optional. Specifies whether the replication regional endpoint is enabled. Requests will not be routed to a replication whose regional endpoint is disabled, however its data will continue to be synced with other replications. |
| `registryName` | string |  |  | Required. The name of the registry. |
| `tags` | object | `{object}` |  | Optional. Tags of the resource. |
| `zoneRedundancy` | string | `Disabled` | `[Disabled, Enabled]` | Optional. Whether or not zone redundancy is enabled for this container registry |

### Parameter Usage: `tags`

Tag names and tag values can be provided as needed. A tag can be left without a value.

```json
"tags": {
    "value": {
        "Environment": "Non-Prod",
        "Contact": "test.user@testcompany.com",
        "PurchaseOrder": "1234",
        "CostCenter": "7890",
        "ServiceName": "DeploymentValidation",
        "Role": "DeploymentValidation"
    }
}
```

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the replication. |
| `resourceGroupName` | string | The name of the resource group the replication was created in. |
| `resourceId` | string | The resource ID of the replication. |

## Template references

- [Registries/Replications](https://docs.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2021-12-01-preview/registries/replications)
