@{
    RootModule        = "Bin/Okta.PS.dll"
    ModuleVersion     = "0.1.0"
    GUID              = "0c4541cc-bfa1-4e7f-abd6-0372a92365db"
    Author            = "Matt McNabb"
    Copyright         = "(c) Matt McNabb . All rights reserved."
    Description       = "The unofficial Okta administrator module. Leverages the Okta .NET SDK to automate administrator and developer tasks in your Okta org. Compatible with Windows PowerShell 5.1, and PowerShell Core on Windows, Linux, and Mac."
    CompatiblePSEditions = "Desktop","Core"
    PowerShellVersion = "5.1"
    FormatsToProcess  = @(
        "Formats/Application.format.ps1xml"
        "Formats/ApplicationGroupAssignment.format.ps1xml"
        "Formats/Factor.format.ps1xml"
        "Formats/Group.format.ps1xml"
        "Formats/LogEvent.format.ps1xml"
        "Formats/OktaClientConfiguration.format.ps1xml"
        "Formats/Policy.format.ps1xml"
        "Formats/PolicyRule.format.ps1xml"
        "Formats/User.format.ps1xml"
    )
    CmdletsToExport = @(
        "Connect-Okta"
        "Disconnect-Okta"
        "Get-OktaApp"
        "Get-OktaAppGroupAssignment"
        "Get-OktaConnection"
        "Get-OktaFactor"
        "Get-OktaGroup"
        "Get-OktaLogEvent"
        "Get-OktaPolicy"
        "Get-OktaPolicyRule"
        "Get-OktaUser"
        "Get-OktaUserAdminRole"
    )
    PrivateData       = @{
        PSData = @{
            Tags         = "Okta", "REST", "IAM", "Identity", "PSEdition_Core", "PSEdition_Desktop", "Windows", "Linux", "macOS"
            LicenseUri   = "https://github.com/mattmcnabb/Okta/blob/master/license"
            ProjectUri   = "https://github.com/mattmcnabb/Okta"
        }
    }
}
