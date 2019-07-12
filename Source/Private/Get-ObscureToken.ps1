function Get-ObscureToken
{
    [CmdletBinding()]
    [OutputType([string])]
    param
    (
        [Parameter(Mandatory)]
        [ValidateLength(42,42)]
        [string]
        $Token,

        [Parameter(Mandatory)]
        [int]
        $VisibleLength
    )

    $ObscureLength = $Token.Length - $VisibleLength
    [string]::Concat(
        "".PadLeft($ObscureLength, '*'),
        $Token.Substring($ObscureLength)
    )
}
