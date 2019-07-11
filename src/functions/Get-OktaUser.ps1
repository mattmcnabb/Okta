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
        Test-OktaConnection
        $Type = $PSCmdlet.MyInvocation.MyCommand.OutputType.Type
        
        $Task = switch ($PSCmdlet.ParameterSetName)
        {
            "Identity"
            {
                Invoke-Method -Type $Type -MethodName "GetUser" -Arguments @($Script:ModuleClient, $Identity)
            }

            "Filter"
            {
                Invoke-Method -Type $Type -MethodName "FilterUsers" -Arguments @($Script:ModuleClient, $Filter)
            }

            "All"
            {
                Invoke-Method -Type $Type -MethodName "GetAllUsers" -Arguments @($Script:ModuleClient)
            }
        }

        $Result = Wait-Task -Task $Task

        foreach ($Item in $Result)
        {
            $Type::new($Item)
        }
    }
    catch
    {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}
