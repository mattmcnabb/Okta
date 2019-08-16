---
external help file: Okta.PS.dll-Help.xml
Module Name: Okta
online version:
schema: 2.0.0
---

# Get-OktaAppGroupAssignment

## SYNOPSIS
Gets group assignments for an application.

## SYNTAX

```
Get-OktaAppGroupAssignment -App <Application> [<CommonParameters>]
```

## DESCRIPTION
Returns a group assignment object for an app. This object can be used to retrieve the group objects.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-OktaApp -Identity "0oam0ns76yDLwm7t60h7" | Get-OktaAppGroupAssignment
```

Get the group assignments for an app.

## PARAMETERS

### -App
The app to return group assignments for.

```yaml
Type: Application
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

### Okta.Sdk.Application

## OUTPUTS

### Okta.Sdk.ApplicationGroupAssignment

## NOTES

## RELATED LINKS
