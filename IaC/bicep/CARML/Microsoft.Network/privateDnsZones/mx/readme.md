# Network Private Dns Zones MX record `[Microsoft.Network/privateDnsZones/MX]`

This module deploys Network PrivateDnsZones MX record.

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Network/privateDnsZones/MX` | 2020-06-01 |

## Parameters

| Parameter Name | Type | Default Value | Possible Values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `cuaId` | string |  |  | Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered |
| `metadata` | object | `{object}` |  | Optional. The metadata attached to the record set. |
| `mxRecords` | array | `[]` |  | Optional. The list of MX records in the record set. |
| `name` | string |  |  | Required. The name of the A record. |
| `privateDnsZoneName` | string |  |  | Required. Private DNS zone name. |
| `ttl` | int | `3600` |  | Optional. The TTL (time-to-live) of the records in the record set. |

### Parameter Usage: `mxRecords`

```json
"mxRecords": {
    "value": [
      {
        "exchange": "string",
        "preference": "int"
      }
    ]
}
```

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the deployed MX record |
| `resourceGroupName` | string | The resource group of the deployed MX record |
| `resourceId` | string | The resource ID of the deployed MX record |

## Template references

- [Privatednszones/MX](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/MX)
