---
external help file: Okta.PS.dll-Help.xml
Module Name: Okta
online version:
schema: 2.0.0
---

# Get-OktaGroup

## SYNOPSIS
Gets one or more Okta groups.

## SYNTAX

### Identity (Default)
```
Get-OktaGroup [-Identity] <String> [<CommonParameters>]
```

### Filter
```
Get-OktaGroup -Filter <String> [<CommonParameters>]
```

### User
```
Get-OktaGroup -User <User> [<CommonParameters>]
```

### App
```
Get-OktaGroup -App <Application> [<CommonParameters>]
```

### All
```
Get-OktaGroup [-All] [<CommonParameters>]
```

## DESCRIPTION
Gets one or more Okta groups by specifying the group Id, or searches based on a filter string.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-OktaGroup -Identity "00gb3syzldEpE5JNj0h7"
```

Get a single group by its Id property.

### Example 2
```powershell
PS C:\> Get-OktaGroup -All
```

Get all the groups in your Okta org.

### Example 3
```powershell
PS C:\> Get-OktaGroup -Filter 'type eq "OKTA_GROUP"'
```

Get any groups of type OKTA_GROUP by specifying a filter string.

### Example 4
```powershell
PS C:\> Get-OktaUser -Identity "matt" | Get-OktaGroup
```

Get groups with user matt as a member.

### Example 5
```powershell
PS C:\> Get-OktaApp -Identity "00hh2hjrlgEpE5JNj8h9" | Get-OktaGroup
```

Get groups assigned to a particular application.

## PARAMETERS

### -All
Will return all groups in the Okta org.

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
Specifies a filter string to return a subset of groups.

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

### -Identity
Specifies the Id of the group.

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
Specifies a user to return group membership for.

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

### -App
Specifies an Okta app, and will return all groups assigned to that app.

```yaml
Type: Application
Parameter Sets: App
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

## OUTPUTS

### Okta.Sdk.Group

## NOTES

## RELATED LINKS

[Groups](https://developer.okta.com/docs/reference/api/groups)
