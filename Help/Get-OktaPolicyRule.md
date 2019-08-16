---
external help file: Okta.PS.dll-Help.xml
Module Name: Okta
online version:
schema: 2.0.0
---

# Get-OktaPolicyRule

## SYNOPSIS
Gets one or more Okta policy rules.

## SYNTAX

```
Get-OktaPolicyRule [-RuleId <String>] -Id <String> [<CommonParameters>]
```

## DESCRIPTION
Gets one or more Okta policy rules. Accepts a policy If via the pipeline and a rule Id can also be supplied to retrieve only a particular rule.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-OktaPolicy -Identity "00pmw1mgtiHPRsYJH0h7" | Get-OktaPolicyRule
```

Get all rules for a policy.

### Example 2
```powershell
PS C:\> Get-OktaPolicy -Identity "00pmw1mgtiHPRsYJH0h7" | Get-OktaPolicyRule -RuleId "0prmw1on9kK5Yr6aW0h7"
```

Get a specific policy rule.


## PARAMETERS

### -Id
The Id of the policy to retrieve rules for. This can be specified as a string, or by passing one or more policy objects via the pipeline.

```yaml
Type: String
Parameter Sets: (All)
Aliases: PolicyId

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -RuleId
The Id of the rule you'd like to retrieve.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### Okta.Sdk.PolicyRule

## NOTES

## RELATED LINKS
