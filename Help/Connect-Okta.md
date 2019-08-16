---
external help file: Okta.PS.dll-Help.xml
Module Name: Okta
online version:
schema: 2.0.0
---

# Connect-Okta

## SYNOPSIS
Create a connection to your Okta org.

## SYNTAX

```
Connect-Okta [-OktaDomain] <String> [-ApiToken] <String> [<CommonParameters>]
```

## DESCRIPTION
Creates a persistent connection to your Okta org. This connection will persist as long as your PowerShell is open or until you remove or re-import the Okta module, or until you run the Disconnect-Okta command.

## EXAMPLES

### Example 1
```powershell
PS C:\> Connect-Okta -OktaDomain https://myorg.okta.com -ApiToken "00wc414Z6FMkJyLnXTPfQTl3JpeiFniYa8j4avjVPe"
```

This example demonstrates connecting to an Okta org "MyOrg."

## PARAMETERS

### -ApiToken
Your Okta API token. This token can be generated in the Okta admin console, and should be protected as a privileged credential. Be aware that API permissions for the token are the same as the permissions for the user who created the token.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OktaDomain
The full URL of your Okta org. This must use the "https://" prefix.

```yaml
Type: String
Parameter Sets: (All)
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

### None

## OUTPUTS

### Okta.Sdk.Configuration.OktaClientConfiguration
## NOTES

## RELATED LINKS

[API Tokens](https://developer.okta.com/docs/guides/create-an-api-token/overview/)
