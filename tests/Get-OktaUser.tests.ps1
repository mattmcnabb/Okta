param
(
    $ModulePath
)

Import-Module $ModulePath -Force

    Describe "Get-OktaUser" {
        $Splat_ModuleName = @{ModuleName = "Okta"}
        Mock Wait-Task { New-MockObject -Type Okta.Sdk.User } @Splat_ModuleName
        Mock Invoke-Method { New-MockObject System.Threading.Tasks.Task } @Splat_ModuleName

        # tests where an API connection is not needed
        Context "No Connection" {
            It "enforces exclusive parameters" {
                { Get-OktaUser -Identity "nuffin" -Filter 'status eq "STAGED"' } | Should Throw "Parameter set cannot be resolved"
            }

            It "throws connection error" {
                { Get-OktaUser -Identity "nuffin" } | Should Throw "No connection to an Okta org was found. Did you run 'Connect-Okta' first?"
            }
        }

        # tests that require a connection object to succeed
        Context "Connection" {
            Mock Test-OktaConnection { } @Splat_ModuleName
            
            It "outputs a User object" {
                Get-OktaUser -Identity "nuffin" | Should BeOfType [Okta.PS.User]
            }

            It "-Identity is positional" {
                { Get-OktaUser "nuffin" } | Should Not Throw
            }
        }

        Context "Methods" {
            Mock Test-OktaConnection { } @Splat_ModuleName
            $GetUser = { $MethodName -eq "GetUser" }
            $FilterUsers = { $MethodName -eq "FilterUsers" }
            $GetAllUsers = { $MethodName -eq "GetAllUsers" }
            Mock Invoke-Method { New-MockObject System.Threading.Tasks.Task } -ParameterFilter $GetUser -Verifiable  @Splat_ModuleName
            Mock Invoke-Method { New-MockObject System.Threading.Tasks.Task } -ParameterFilter $FilterUsers -Verifiable @Splat_ModuleName
            Mock Invoke-Method { New-MockObject System.Threading.Tasks.Task } -ParameterFilter $GetAllUsers -Verifiable @Splat_ModuleName
            Mock Wait-Task { New-MockObject -Type Okta.Sdk.User } @Splat_ModuleName
            $null = Get-OktaUser -Identity "willard.hunter@example.com"
            $null = Get-OktaUser -Filter 'profile.lastName eq "hunter"'
            $null = Get-OktaUser -All
                    
            It "invokes correct method" {
                Assert-MockCalled -CommandName Invoke-Method -ParameterFilter $GetUser -Times 1 @Splat_ModuleName
                Assert-MockCalled -CommandName Invoke-Method -ParameterFilter $FilterUsers -Times 1 @Splat_ModuleName
                Assert-MockCalled -CommandName Invoke-Method -ParameterFilter $GetAllUsers -Times 1 @Splat_ModuleName
            }
        }
    }
