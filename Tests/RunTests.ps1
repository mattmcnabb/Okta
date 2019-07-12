$ModulePath = Join-Path (Split-Path $PSScriptRoot) "Output/Okta"
Invoke-Pester -Script @{Path = $PSScriptRoot; Parameters = @{ModulePath = $ModulePath}}
