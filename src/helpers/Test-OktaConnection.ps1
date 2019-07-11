function Test-OktaConnection
{
    [CmdletBinding()]
    param ()
    
    if (!$Script:ModuleClient)
    {
        $PSCmdlet.ThrowTerminatingError(
            [System.UnauthorizedAccessException]::new(
                "No connection to an Okta org was found. Did you run 'Connect-Okta' first?"
            )
        )
    }
}
