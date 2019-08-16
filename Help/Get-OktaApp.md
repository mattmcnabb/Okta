---
external help file: Okta.PS.dll-Help.xml
Module Name: Okta
online version:
schema: 2.0.0
---

# Get-OktaApp

## SYNOPSIS
Gets one or more Okta apps.

## SYNTAX

### Identity (Default)
```
Get-OktaApp [-Identity] <String> [<CommonParameters>]
```

### Filter
```
Get-OktaApp -Filter <String> [<CommonParameters>]
```

### User
```
Get-OktaApp -User <User> [<CommonParameters>]
```

### Group
```
Get-OktaApp -Group <Group> [<CommonParameters>]
```

### All
```
Get-OktaApp [-All] [<CommonParameters>]
```

## DESCRIPTION
The Get-OktaApp cmdlet returns one or more Okta applications, either specified by Id or by supplying a filter string.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-OktaApp -Id "0oam0ns76yDLwm7t60h7"
```

This examples retrieves an Okta application by its Id.

### Example 2
```powershell
PS C:\> Get-OktaApp -All
```

This example retrieves all Okta apps from connected org.

### Example 3
```powershell
PS C:\> Get-OktaApp -Filter 'status eq "ACTIVE"'
```

This example demonstrates using the filter parameter to retrieve applications that are active.

### Example 4
```powershell
PS C:\> Get-OktaUser -Identity matt | Get-OktaApp
```

This example shows how you can retrieve apps that are assigned to the user "matt" using the pipeline.

### Example 5
```powershell
PS C:\> Get-OktaGroup -Identity "00g1emaKYZTWRYYRRTSK" | Get-OktaApp
```

This example shows how you can retrieve apps that are assigned to a group using the pipeline.

## PARAMETERS

### -All
If specified, will return all apps from the Okta org.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter
The -Filter parameter can be used to return a subset of apps that match the filter string. Only a subset of properties are supported for filtering:

status
user.id
group.id
credentials.signing.kid

Refer to Okta's API documentation to learn more about creating a filter string.

```yaml
Type: String
Parameter Sets: Filter
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Group
Specifies an Okta group and will retrieve the apps assigned to that group.

```yaml
Type: Group
Parameter Sets: Group
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Identity
The Id of the application to be returned.

```yaml
Type: String
Parameter Sets: Identity
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -User
Specifies an Okta user and will retrieve the apps assigned to that user.

```yaml
Type: User
Parameter Sets: User
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Okta.Sdk.User

### Okta.Sdk.Group

## OUTPUTS

### Okta.Sdk.Application

## NOTES

## RELATED LINKS

[Apps](https://developer.okta.com/docs/reference/api/apps)