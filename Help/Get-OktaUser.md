---
external help file: Okta.PS.dll-Help.xml
Module Name: Okta
online version:
schema: 2.0.0
---

# Get-OktaUser

## SYNOPSIS
Gets one or more Okta users.

## SYNTAX

### Identity (Default)
```
Get-OktaUser [-Identity] <String> [<CommonParameters>]
```

### Filter
```
Get-OktaUser -Filter <String> [<CommonParameters>]
```

### All
```
Get-OktaUser [-All] [<CommonParameters>]
```

### Group
```
Get-OktaUser -Group <Group> [<CommonParameters>]
```

### App
```
Get-OktaUser -App <Application> [<CommonParameters>]
```

## DESCRIPTION
Gets one or more Okta users. Users can be specified by Id, searched for using a filter, or enumerated by app assignment or group membership.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-OktaUser -Identity "matt"
```

Get a single Okta user.

### Example 2
```powershell
PS C:\> Get-OktaUser -Filter 'status eq "ACTIVE"'
```

Get any active users by specifying a filter string.

### Example 3
```powershell
PS C:\> Get-OktaUser -All
```

Get all users in the current Okta org.

### Example 4
```powershell
PS C:\> Get-OktaApp -Identity "0oam0ns76yDLwm7t60h7" | Get-OktaUser
```

Get all users assigned to a particular app.

### Example 4
```powershell
PS C:\> Get-OktaApp -Identity "00gb3syzldEpE5JNj0h7" | Get-OktaUser
```

Get all users that are members of a particular group.

## PARAMETERS

### -All
If specified, will return all users in the Okta org.

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

### -App
If specified, will return all users assigned to the app.

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

### -Filter
Specifies a filter string to perform a search of users with. Any users that match the conditions of the filter string will be returned. Many user properties are supported for filtering such as:

status
lastUpdated
id
profile.login
profile.firstName

To learn more about user filters, see the API User document link.

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
Specifies an Okta group for which you'd like to return the members.

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
The unique identifier of the user to retrieve. This can be the Id or Login value, or can be the login shortname if its unambiguous. To retrieve the currently connected user, use "me" instead of an Id.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Okta.Sdk.Group

### Okta.Sdk.Application

## OUTPUTS

### Okta.Sdk.User

## NOTES

## RELATED LINKS

[Users](https://developer.okta.com/docs/reference/api/users)
