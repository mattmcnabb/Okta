function Connect-Okta
{
    [CmdletBinding()]
    [OutputType([Okta.Sdk.Configuration.OktaClientConfiguration])]
    param
    (
        [Parameter(Mandatory)]
        [ValidatePattern("^https\:\/\/[a-zA-Z-0-9]+\.(okta|oktapreview)\.com$")]
        [string]
        $OktaDomain,

        [Parameter(Mandatory)]
        [ValidatePattern("^00[a-zA-Z0-9\\-\\_]{40}$")]
        [string]
        $ApiToken
    )
    
    $Configuration = [Okta.Sdk.Configuration.OktaClientConfiguration]::new()
    $Configuration.OktaDomain = $OktaDomain
    $Configuration.Token = $ApiToken
    $Client = [Okta.Sdk.OktaClient]::new($Configuration)
    
    try
    {
        # test the domain name and API token before setting in module scope
        $null = Get-CurrentUser -Client $Client
        $Script:ModuleClient = $Client
        Get-OktaConnection
    }
    catch
    {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}
