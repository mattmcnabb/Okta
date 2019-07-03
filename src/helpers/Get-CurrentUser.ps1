function Get-CurrentUser
{
    [CmdletBinding()]
    [OutputType([Okta.PS.User])]
    param
    (
        [Parameter(Mandatory)]
        [Okta.Sdk.OktaClient]
        $Client
    )

    [Okta.PS.User]::new([Okta.PS.User]::GetCurrentUser($Client).Result)
}
