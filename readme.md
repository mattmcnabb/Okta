| Azure Pipelines | PowerShell Gallery | Github |
|:----------------|:-------------------|:-------|
| ![Build Status](https://img.shields.io/azure-devops/build/mmcnabb/250eaaa6-9ec4-4a14-b1dd-851aaed6ad0e/7/master.svg) | ![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/Okta.svg) | ![Github Releases](https://img.shields.io/github/downloads/mattmcnabb/Okta/total.svg) |

# Okta module for PowerShell

## Description
A PowerShell module for administering and automating your Okta org. It leverages the official Okta .Net SDK, but is unofficial and is not supported by Okta in any way. Runs on Windows PowerShell or cross-platform on PowerShell Core for Windows, Mac and Linux.

## Requirements
Windows PowerShell v5.1
PowerShell Core 6+ (Linux, Mac, or Windows)

## Getting Started
### Install and import the module
In a PowerShell console run `Install-Module Okta` and confirm that you'd like to install the module. Once installed, you can import the module by running `Import-Module Okta`.

### Create an Okta API token
In order to make calls against the Okta API, you'll need to generate an API token in the administrator console. Instructions for this can be found [here](https://developer.okta.com/docs/guides/create-an-api-token/overview/). Keep in mind that this token will only be granted the same administrative privileges as the account that created it. Some commands in this module may not work properly if your API token does not have permission to perform some actions.

### Connect to your Okta org

```powershell
Connect-Okta -OktaDomain https://myorg.okta.com -ApiToken "00wc414Z6FMkJyLnXTPfQTl3JpeiFniYa8j4avjVPe"
```

### View an existing connection:

```powershell
Get-OktaConnection
```

### Disconnect from your org

```powershell
Disconnect-Okta
```

Or you can simply remove or re-import the module.

### Get a user by identifier

```powershell
Get-OktaUser -Identity jlannister
```

### Get users with a filter

```powershell
Get-OktaUser -Filter 'status eq "ACTIVE"'
```

### Get apps

```powershell
Get-OktaApp -All
```

### Get groups

```powershell
Get-OktaUser -Filter 'status eq "ACTIVE"'
```

### Get system event logs

```powershell
Get-OktaLogEvent -StartDate 6/1/2019
```

### Other commands
You can find other commands to explore and manage groups, roles, events and more by running `Get-Command -Module Okta`.
