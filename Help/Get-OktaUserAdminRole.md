---
external help file: Okta.PS.dll-Help.xml
Module Name: Okta
online version:
schema: 2.0.0
---

# Get-OktaUserAdminRole

## SYNOPSIS
Returns the administrative roles assigned to an Okta user.

## SYNTAX

```
Get-OktaUserAdminRole -User <User> [<CommonParameters>]
```

## DESCRIPTION
Returns the administrative roles assigned to an Okta user.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-OktaUser -Identity matt | Get-OktaUserAdminRole
```

Get the administrative roles assigned to the user "matt."

## PARAMETERS

### -User
The Okta user to retrieve administrative roles for.

```yaml
Type: User
Parameter Sets: (All)
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

### Okta.Sdk.Role

## NOTES

## RELATED LINKS
