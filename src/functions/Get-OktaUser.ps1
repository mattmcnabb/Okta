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
        switch ($PSCmdlet.ParameterSetName)
        {
            "Identity"
            {
                [Okta.PS.User]::new([Okta.PS.User]::GetUser($Script:Moduleclient, $Identity).Result)
            }

            "Filter"
            {
                foreach ($Item in [Okta.PS.User]::FilterUsers($Script:Moduleclient, $Filter).Result)
                {
                    [Okta.PS.User]::new($Item)
                }
            }

            "All"
            {
                foreach ($Item in [Okta.PS.User]::GetAllUsers($Script:Moduleclient).Result)
                {
                    [Okta.PS.User]::new($Item)
                }
            }
        }
    }
    catch
    {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}
