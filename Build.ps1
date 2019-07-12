$OutputPath = "$PSScriptRoot\Output"
$BinPath = "$PSScriptRoot\Source\Bin"
$OktaPSPath = "$PSScriptRoot\Okta.PS"
$BuildManifestPath = "$PSScriptRoot\Source\build.psd1"
Remove-Item $BinPath, $OutputPath -Force -Recurse -ErrorAction Ignore
dotnet publish -c Release -o $BinPath $OktaPSPath
Build-Module -SourcePath $BuildManifestPath -OutputDirectory $OutputPath
