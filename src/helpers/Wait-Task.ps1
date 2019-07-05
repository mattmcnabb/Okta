function Wait-Task
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [System.Threading.Tasks.Task]
        $Task
    )

    try
    {
        $Task.Wait()
        $Task.Result
    }
    catch
    {
        throw $Task.Exception.InnerException
    }
}
