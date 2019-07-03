function Get-OktaConnection
{
    [CmdletBinding()]
    [OutputType([Okta.Sdk.Configuration.OktaClientConfiguration])]
    param
    (

    )

    $Configuration = [Okta.Sdk.Configuration.OktaClientConfiguration]::new()
    $Configuration.OktaDomain = $Script:ModuleClient.Configuration.OktaDomain
    $Configuration.Token = Get-ObscureToken -Token $Script:ModuleClient.Configuration.Token -VisibleLength 8
    $Configuration
}
