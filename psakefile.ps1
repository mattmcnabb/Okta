properties {
    $IsBuild = [Bool]$env:TF_BUILD
    $ModuleName = "Okta"
    $PublishPath = Join-Path $PSScriptRoot "publish"
    $PublishModulePath = Join-Path $PublishPath $ModuleName
    $PublishPsm1Path = Join-Path $PublishModulePath "$ModuleName.psm1"
    $DocsPath = Join-Path $PSScriptRoot "docs"
    $FormatsPath = Join-Path $PSScriptRoot "formats"
    $SrcPath = Join-Path $PSScriptRoot "src"
    $ManifestPath = Join-Path $SrcPath "$ModuleName.psd1"
    $CSProjPath = Join-Path $SrcPath "$ModuleName.csproj"
    $ObjPath = Join-Path $SrcPath "obj"
    $BinPath = Join-Path $SrcPath "bin"
    $TestsPath = Join-Path $PSScriptRoot "tests"
    $FunctionsPath = Join-Path $SrcPath "functions"
    $HelpersPath = Join-Path $SrcPath "helpers"
}

task Compile -action {
    # build and publish dotnet project
    New-Item -Path $PublishModulePath -ItemType Directory -Force
    dotnet build $CSProjPath
    dotnet publish $CSProjPath -o $PublishModulePath

    # copy module manifest to publish folder
    Copy-Item $ManifestPath $PublishModulePath -PassThru

    # copy module functions into a single module file and copy to publish folder
    #New-Item -Path $PublishPsm1Path -ItemType File -Force
    foreach ($Script in (Get-ChildItem -Path $HelpersPath, $FunctionsPath -Filter *.ps1 -File))
    {
        Get-Content -Path $Script.FullName | Out-File -FilePath $PublishPsm1Path -Append -Encoding utf8
    }
}

task Test -action {
    $PesterParams = @{
        Script = @{
            Path       = $Testspath
            Parameters = @{ModulePath = $PublishModulePath }
        }
        PesterOption = @{IncludeVSCodeMarker = $true}
        EnableExit   = $IsBuild
    }
    Invoke-Pester @PesterParams
}

task Clean -action {
    Remove-Item -Path $PublishPath -Confirm:$false -Recurse -ErrorAction Ignore
    Remove-Item -Path $ObjPath -Confirm:$false -Recurse -ErrorAction Ignore
    Remove-Item -Path $ObjPath -Confirm:$false -Recurse -ErrorAction Ignore
}

task BuildTools -action {
    Install-Module Pester -Force -SkipPublisherCheck
}
