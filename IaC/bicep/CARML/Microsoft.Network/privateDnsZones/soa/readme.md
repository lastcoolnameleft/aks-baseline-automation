# Network Private Dns Zones SOA record `[Microsoft.Network/privateDnsZones/SOA]`

This module deploys Network PrivateDnsZones SOA record.

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Network/privateDnsZones/SOA` | 2020-06-01 |

## Parameters

| Parameter Name | Type | Default Value | Possible Values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `cuaId` | string |  |  | Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered |
| `metadata` | object | `{object}` |  | Optional. The metadata attached to the record set. |
| `name` | string |  |  | Required. The name of the A record. |
| `privateDnsZoneName` | string |  |  | Required. Private DNS zone name. |
| `soaRecord` | object | `{object}` |  | Optional. A SOA record. |
| `ttl` | int | `3600` |  | Optional. The TTL (time-to-live) of the records in the record set. |

### Parameter Usage: `soaRecord`

```json
"soaRecord": {
    "value": {
      "email": "string",
      "expireTime": "int",
      "host": "string",
      "minimumTtl": "int",
      "refreshTime": "int",
      "retryTime": "int",
      "serialNumber": "int"
    }
}
```

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the deployed SOA record |
| `resourceGroupName` | string | The resource group of the deployed SOA record |
| `resourceId` | string | The resource ID of the deployed SOA record |

## Template references

- [Privatednszones/SOA](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/SOA)
