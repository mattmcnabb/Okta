function Get-OktaUser
{
    [CmdletBinding(DefaultParameterSetName = "Identity")]
    [OutputType([Okta.PS.User])]
    param
    (
        [Parameter(Mandatory, ParameterSetName = "Identity")]
        [string]
        $Identity,

        [Parameter(Mandatory, ParameterSetName = "Filter")]
        [string]
        $Filter,

        [Parameter(Mandatory, ParameterSetName = "All")]
        [switch]
        $All
    )
    
    try
    {
        $Task = switch ($PSCmdlet.ParameterSetName)
        {
            "Identity"
            {
                [Okta.PS.User]::GetUser($Script:Moduleclient, $Identity)
            }

            "Filter"
            {
                [Okta.PS.User]::FilterUsers($Script:Moduleclient, $Filter)
            }

            "All"
            {
                [Okta.PS.User]::GetAllUsers($Script:Moduleclient)
            }
        }

        $Result = Wait-Task -Task $Task

        foreach ($Item in $Result)
        {
            [Okta.PS.User]::new($Item)
        }
    }
    catch
    {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}
