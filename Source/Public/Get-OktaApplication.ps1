function Get-OktaApplication
{
    [CmdletBinding()]
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
        $All,

        [Parameter(Mandatory, ParameterSetName = "User", ValueFromPipeline)]
        [Okta.PS.User]
        $User
    )

    process
    {
        try
        {
            $Task = switch ($PSCmdlet.ParameterSetName)
            {
                "Identity"
                {
                    [Okta.PS.Application]::GetApplication($Script:Moduleclient, $Identity)
                }

                "Filter"
                {
                    [Okta.PS.Application]::FilterApplications($Script:Moduleclient, $Filter)
                }

                "User"
                {
                    [Okta.PS.Application]::FilterApplications($Script:Moduleclient, "user.id eq `"$($User.Id)`"")
                }

                "All"
                {
                    [Okta.PS.Application]::GetAllApplications($Script:Moduleclient)
                }
            }

            $Result = Wait-Task -Task $Task

            foreach ($Item in $Result)
            {
                [Okta.PS.Application]::new($Item)
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
}
