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
        [ValidatePattern("^00[a-zA-Z0-9\-\\_]{40}$")]
        [string]
        $ApiToken
    )
    
    
    $Client = [Okta.Sdk.OktaClient]::new(
        [Okta.Sdk.Configuration.OktaClientConfiguration]@{
            OktaDomain = $OktaDomain
            Token      = $ApiToken
        }
    )
    
    try
    {
        # test the domain name and API token before setting in module scope
        $null = Get-CurrentUser -Client $Client
        $Script:ModuleClient = $Client
        Get-OktaConnection
    }
    catch
    {
        throw [System.ArgumentException]::new(
            'Failed to connect to your Okta org with the parameters provided.',
            $_.Exception
        )
    }
}
