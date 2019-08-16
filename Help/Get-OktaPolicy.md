---
external help file: Okta.PS.dll-Help.xml
Module Name: Okta
online version:
schema: 2.0.0
---

# Get-OktaPolicy

## SYNOPSIS
Gets Okta sign on and password policies.

## SYNTAX

### Identity (Default)
```
Get-OktaPolicy -Identity <String> [<CommonParameters>]
```

### Type
```
Get-OktaPolicy -Type <String> [<CommonParameters>]
```

## DESCRIPTION
Gets Okta sign on and password policies.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-OktaPolicy -Identity "00pmw1mgtiHPRsYJH0h7"
```

Get a policy by its Id.

### Example 2
```powershell
PS C:\> Get-OktaPolicy -Type OktaSignOn
```

Get all policies of type OktaSignOn.

### Example 2
```powershell
PS C:\> Get-OktaPolicy -Type Password
```

Get all policies of type Password.

## PARAMETERS

### -Identity
The Id of the policy to retrieve.

```yaml
Type: String
Parameter Sets: Identity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
The type of policies you'd like to retrieve. Can be either Password or OktaSignOn.

```yaml
Type: String
Parameter Sets: Type
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### Okta.Sdk.Policy

## NOTES

## RELATED LINKS
