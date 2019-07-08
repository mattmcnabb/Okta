param
(
    $ModulePath
)

Import-Module $ModulePath -Force

InModuleScope "Okta" {
    Describe "Get-OktaUser" {
        It "fails" {
           2 + 2 | Should Be 5
        }
    }
}
