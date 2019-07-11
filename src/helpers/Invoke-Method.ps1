function Invoke-Method
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [System.Type]
        $Type,

        [Parameter(Mandatory)]
        [string]
        $MethodName,

        [object[]]
        $Arguments
    )
    
    $BindingFlags = [Reflection.BindingFlags] "Public,Static"
    $Method = $Type.GetMethod($MethodName, $BindingFlags)
    $Method.Invoke($null, $Arguments)
}
