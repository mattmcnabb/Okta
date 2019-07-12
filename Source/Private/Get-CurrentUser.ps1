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
    
    $Result = Wait-Task -Task ([Okta.PS.User]::GetCurrentUser($Client)) -ErrorAction Stop
    [Okta.PS.User]::new($Result)       
}
