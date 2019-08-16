# clean up
Set-Location $PSScriptRoot
Remove-Item ./Output -Recurse -Force -ErrorAction Ignore
Remove-Item ./Source/Bin -Recurse -Force -ErrorAction Ignore
Remove-Item ./Source/en-US -Recurse -Force -ErrorAction Ignore

dotnet publish ./Okta.PS/Okta.PS.csproj -o ../Source/Bin -c release
New-ExternalHelp -Path .\Help -OutputPath .\Source\en-US
Build-Module -SourcePath ./Source/build.psd1
