---
external help file: Okta.PS.dll-Help.xml
Module Name: Okta
online version:
schema: 2.0.0
---

# Get-OktaLogEvent

## SYNOPSIS
Gets one or more Okta system log events entries.

## SYNTAX

### Filter (Default)
```
Get-OktaLogEvent [-StartDate <DateTime>] [-EndDate <DateTime>] -Filter <String> [<CommonParameters>]
```

### All
```
Get-OktaLogEvent [-StartDate <DateTime>] [-EndDate <DateTime>] [-All] [<CommonParameters>]
```

### TargetId
```
Get-OktaLogEvent [-StartDate <DateTime>] [-EndDate <DateTime>] -TargetId <String> [<CommonParameters>]
```

### Keywords
```
Get-OktaLogEvent [-StartDate <DateTime>] [-EndDate <DateTime>] -Keywords <String> [<CommonParameters>]
```

## DESCRIPTION
Gets one or more Okta system log events entries. These events can be filtered by type, by target objects and by using date/time ranges.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-OktaLogEvent -Filter 'eventType eq "user.session.start"'
```

Get events by event type.

### Example 2
```powershell
PS C:\> Get-OktaUser -Identity "matt" | Get-OktaLogEvent
```

Get events for a specified user. This command is equivalent to clicking on the system log link from a user's page in the Okta admin console.

### Example 3
```powershell
PS C:\> Get-OktaApp -Identity "0oa1gjh63g214q0Hq0g4" | Get-OktaLogEvent
```

Get events for a specified app. This will return any events where the app was the target of the operation.

### Example 3
```powershell
PS C:\> Get-OktaGroup -Identity "0oa1gjh63g214q0Hq0g4" | Get-OktaLogEvent
```

Get events for a specified group. This will return any events where the group was the target of the operation.

### Example 4
```powershell
PS C:\> Get-OktaLogEvent -All -StartDate 1/1/2019 -EndDate 2/1/2019
```

Get all events in a specified time range.

## PARAMETERS

### -All
If specified, will return all events in the given time range.

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

### -EndDate
The end of the time range you'd like to retrieve events for. If not specified, the default value is now. -EndDate can always be used to limit the time range of events returned, regardless of the parameter set.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter
Specifies a filter string to perform an event log search. Most properties of events are supported for filtering, including nested properties. See the Okta API System Log document link to learn more about how to compose these filter strings.

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

### -Keywords
Specifies keywords to perform an exact match search for log events. These keywords should be specified as a single string and separated by spaces. A total of 10 keywords is supported, each with a maximum length of 40 characters. Keywords are not case-sensitive. See the System Log API reference page to learn more about keyword searches for log events.

```yaml
Type: String
Parameter Sets: Keywords
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDate
The beginning date of the time range you'd like retrieve events for. If -StartDate isn't specified, the default value is 7 days prior to the current date and time. -StartDate can always be used to limit the time range of events returned, regardless of the parameter set.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetId
The Id of the Okta object to retrieve events for. This can be nearly any Okta object type such as a user, group or app. -TargetId accepts input via the pipeline, so go ahead and pipe in a user or group object and see what happens!

```yaml
Type: String
Parameter Sets: TargetId
Aliases: Id

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### Okta.Sdk.LogEvent

## NOTES

## RELATED LINKS

[System Log](https://developer.okta.com/docs/reference/api/system-log)
