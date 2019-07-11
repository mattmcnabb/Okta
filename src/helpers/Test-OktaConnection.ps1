function Test-OktaConnection
{
    [CmdletBinding()]
    param ()
    
    if (!$Script:ModuleClient)
    {
        throw [System.UnauthorizedAccessException]::new(
            "No connection to an Okta org was found. Did you run 'Connect-Okta' first?"
        )
    }
}
