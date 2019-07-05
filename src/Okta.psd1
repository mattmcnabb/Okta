@{
    RootModule           = "Okta.psm1"
    RequiredAssemblies   = "Okta.PS.dll", "Okta.Sdk.dll"
    ModuleVersion        = "0.1.0"
    GUID                 = "0c4541cc-bfa1-4e7f-abd6-0372a92365db"
    Author               = "Matt McNabb"
    Copyright            = "(c) Matt McNabb . All rights reserved."
    Description          = "The unofficial Okta administrator module. Leverages the Okta .NET SDK to automate administrator and developer tasks in your Okta org. Compatible with Windows PowerShell 5.1, and PowerShell Core on Windows, Linux, and Mac."
    CompatiblePSEditions = "Desktop", "Core"
    PowerShellVersion    = "5.1"
    FormatsToProcess     = @(

    )
    CmdletsToExport      = @(
        "Connect-Okta"
        "Get-OktaApplication"
        "Get-OktaConnection"
        "Get-OktaUser"
    )
    PrivateData          = @{
        PSData = @{
            Tags       = "Okta", "REST", "IAM", "Identity", "PSEdition_Core", "PSEdition_Desktop", "Windows", "Linux", "macOS"
            LicenseUri = "https://github.com/mattmcnabb/Okta/blob/master/Okta/license"
            ProjectUri = "https://github.com/mattmcnabb/Okta"
        }
    }
}
