---
external help file: Okta.PS.dll-Help.xml
Module Name: Okta
online version:
schema: 2.0.0
---

# Get-OktaFactor

## SYNOPSIS
Gets all of a user's enrolled factors.

## SYNTAX

```
Get-OktaFactor -User <User> [<CommonParameters>]
```

## DESCRIPTION
Gets all of a user's enrolled factors.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-OktaUser -Identity "matt" | Get-OktaFactor
```

Get the factors a user has enrolled.

## PARAMETERS

### -User
The Okta user to return factors for.

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

### Okta.Sdk.Factor

## NOTES

## RELATED LINKS

[Factors](https://developer.okta.com/docs/reference/api/factors)
