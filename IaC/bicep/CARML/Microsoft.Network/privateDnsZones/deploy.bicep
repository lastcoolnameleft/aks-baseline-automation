@description('Required. Private DNS zone name.')
param name string

@description('Optional. Array of A records.')
param a array = []

@description('Optional. Array of AAAA records.')
param aaaa array = []

@description('Optional. Array of CNAME records.')
param cname array = []

@description('Optional. Array of MX records.')
param mx array = []

@description('Optional. Array of PTR records.')
param ptr array = []

@description('Optional. Array of SOA records.')
param soa array = []

@description('Optional. Array of SRV records.')
param srv array = []

@description('Optional. Array of TXT records.')
param txt array = []

@description('Optional. Array of custom objects describing vNet links of the DNS zone. Each object should contain properties \'vnetResourceId\' and \'registrationEnabled\'. The \'vnetResourceId\' is a resource ID of a vNet to link, \'registrationEnabled\' (bool) enables automatic DNS registration in the zone for the linked vNet.')
param virtualNetworkLinks array = []

@description('Optional. The location of the PrivateDNSZone. Should be global.')
param location string = 'global'

@description('Optional. Array of role assignment objects that contain the \'roleDefinitionIdOrName\' and \'principalId\' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: \'/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11\'')
param roleAssignments array = []

@description('Optional. Tags of the resource.')
param tags object = {}

@allowed([
  'CanNotDelete'
  'NotSpecified'
  'ReadOnly'
])
@description('Optional. Specify the type of lock.')
param lock string = 'NotSpecified'

@description('Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered')
param cuaId string = ''

module pid_cuaId '.bicep/nested_cuaId.bicep' = if (!empty(cuaId)) {
  name: 'pid-${cuaId}'
  params: {}
}

resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: name
  location: location
  tags: tags
}

module privateDnsZone_a 'a/deploy.bicep' = [for (aRecord, index) in a: {
  name: '${uniqueString(deployment().name, location)}-PrivateDnsZone-ARecord-${index}'
  params: {
    privateDnsZoneName: privateDnsZone.name
    name: aRecord.name
    aRecords: contains(aRecord, 'aRecords') ? aRecord.aRecords : []
    metadata: contains(aRecord, 'metadata') ? aRecord.metadata : {}
    ttl: contains(aRecord, 'ttl') ? aRecord.ttl : 3600
  }
}]

module privateDnsZone_aaaa 'aaaa/deploy.bicep' = [for (aaaaRecord, index) in aaaa: {
  name: '${uniqueString(deployment().name, location)}-PrivateDnsZone-AAAARecord-${index}'
  params: {
    privateDnsZoneName: privateDnsZone.name
    name: aaaaRecord.name
    aaaaRecords: contains(aaaaRecord, 'aaaaRecords') ? aaaaRecord.aaaaRecords : []
    metadata: contains(aaaaRecord, 'metadata') ? aaaaRecord.metadata : {}
    ttl: contains(aaaaRecord, 'ttl') ? aaaaRecord.ttl : 3600
  }
}]

module privateDnsZone_cname 'cname/deploy.bicep' = [for (cnameRecord, index) in cname: {
  name: '${uniqueString(deployment().name, location)}-PrivateDnsZone-CNAMERecord-${index}'
  params: {
    privateDnsZoneName: privateDnsZone.name
    name: cnameRecord.name
    cnameValue: !empty(cnameRecord.cname) ? cnameRecord.cname : ''
    metadata: contains(cnameRecord, 'metadata') ? cnameRecord.metadata : {}
    ttl: contains(cnameRecord, 'ttl') ? cnameRecord.ttl : 3600
  }
}]

module privateDnsZone_mx 'mx/deploy.bicep' = [for (mxRecord, index) in mx: {
  name: '${uniqueString(deployment().name, location)}-PrivateDnsZone-MXRecord-${index}'
  params: {
    privateDnsZoneName: privateDnsZone.name
    name: mxRecord.name
    metadata: contains(mxRecord, 'metadata') ? mxRecord.metadata : {}
    mxRecords: contains(mxRecord, 'mxRecords') ? mxRecord.mxRecords : []
    ttl: contains(mxRecord, 'ttl') ? mxRecord.ttl : 3600
  }
}]

module privateDnsZone_ptr 'ptr/deploy.bicep' = [for (ptrRecord, index) in ptr: {
  name: '${uniqueString(deployment().name, location)}-PrivateDnsZone-PTRRecord-${index}'
  params: {
    privateDnsZoneName: privateDnsZone.name
    name: ptrRecord.name
    metadata: contains(ptrRecord, 'metadata') ? ptrRecord.metadata : {}
    ptrRecords: contains(ptrRecord, 'ptrRecords') ? ptrRecord.ptrRecords : []
    ttl: contains(ptrRecord, 'ttl') ? ptrRecord.ttl : 3600
  }
}]

module privateDnsZone_soa 'soa/deploy.bicep' = [for (soaRecord, index) in soa: {
  name: '${uniqueString(deployment().name, location)}-PrivateDnsZone-SOARecord-${index}'
  params: {
    privateDnsZoneName: privateDnsZone.name
    name: soaRecord.name
    metadata: contains(soaRecord, 'metadata') ? soaRecord.metadata : {}
    soaRecord: contains(soaRecord, 'soaRecord') ? soaRecord.soaRecord : {}
    ttl: contains(soaRecord, 'ttl') ? soaRecord.ttl : 3600
  }
}]

module privateDnsZone_srv 'srv/deploy.bicep' = [for (srvRecord, index) in srv: {
  name: '${uniqueString(deployment().name, location)}-PrivateDnsZone-SRVRecord-${index}'
  params: {
    privateDnsZoneName: privateDnsZone.name
    name: srvRecord.name
    metadata: contains(srvRecord, 'metadata') ? srvRecord.metadata : {}
    srvRecords: contains(srvRecord, 'srvRecords') ? srvRecord.srvRecords : []
    ttl: contains(srvRecord, 'ttl') ? srvRecord.ttl : 3600
  }
}]

module privateDnsZone_txt 'txt/deploy.bicep' = [for (txtRecord, index) in txt: {
  name: '${uniqueString(deployment().name, location)}-PrivateDnsZone-TXTRecord-${index}'
  params: {
    privateDnsZoneName: privateDnsZone.name
    name: txtRecord.name
    metadata: contains(txtRecord, 'metadata') ? txtRecord.metadata : {}
    txtRecords: contains(txtRecord, 'txtRecords') ? txtRecord.txtRecords : []
    ttl: contains(txtRecord, 'ttl') ? txtRecord.ttl : 3600
  }
}]

module privateDnsZone_virtualNetworkLinks 'virtualNetworkLinks/deploy.bicep' = [for (virtualNetworkLink, index) in virtualNetworkLinks: {
  name: '${uniqueString(deployment().name, location)}-PrivateDnsZone-VirtualNetworkLink-${index}'
  params: {
    privateDnsZoneName: privateDnsZone.name
    name: contains(virtualNetworkLink, 'name') ? virtualNetworkLink.name : '${last(split(virtualNetworkLink.virtualNetworkResourceId, '/'))}-vnetlink'
    virtualNetworkResourceId: virtualNetworkLink.virtualNetworkResourceId
    location: contains(virtualNetworkLink, 'location') ? virtualNetworkLink.location : 'global'
    registrationEnabled: contains(virtualNetworkLink, 'registrationEnabled') ? virtualNetworkLink.registrationEnabled : false
    tags: contains(virtualNetworkLink, 'tags') ? virtualNetworkLink.tags : {}
  }
}]

resource privateDnsZone_lock 'Microsoft.Authorization/locks@2017-04-01' = if (lock != 'NotSpecified') {
  name: '${privateDnsZone.name}-${lock}-lock'
  properties: {
    level: lock
    notes: lock == 'CanNotDelete' ? 'Cannot delete resource or child resources.' : 'Cannot modify the resource or child resources.'
  }
  scope: privateDnsZone
}

module privateDnsZone_rbac '.bicep/nested_rbac.bicep' = [for (roleAssignment, index) in roleAssignments: {
  name: '${uniqueString(deployment().name, location)}-PrivateDnsZone-Rbac-${index}'
  params: {
    principalIds: roleAssignment.principalIds
    roleDefinitionIdOrName: roleAssignment.roleDefinitionIdOrName
    resourceId: privateDnsZone.id
  }
}]

@description('The resource group the private DNS zone was deployed into')
output resourceGroupName string = resourceGroup().name

@description('The name of the private DNS zone')
output name string = privateDnsZone.name

@description('The resource ID of the private DNS zone')
output resourceId string = privateDnsZone.id
