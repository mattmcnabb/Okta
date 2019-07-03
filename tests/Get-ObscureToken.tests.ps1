param
(
    $ModulePath
)

Import-Module $ModulePath -Force

InModuleScope "Okta" {
    Describe "Get-ObscureToken" {
        $Token = "00rc314Z5GMkBtLnXRPfWTl3JPeiVniYa8j4avjNIe"
        $LongToken = "00rc314Z5GMkBtLnXRPfWTl3JPeiVniYa8j4avjNIem" # 43 chars is too much
        
        It "validates length" {
            {Get-ObscureToken -Token $LongToken -VisibleLength 8} | Should Throw "Cannot validate argument on parameter 'Token'. The character length"
        }

        It "obscures token" {
            Get-ObscureToken -Token $Token -VisibleLength 8 | Should Be "**********************************j4avjNIe"
        }

        $Cases = @(
            @{Length = 8; Result = "**********************************j4avjNIe"}
            @{Length = 13; Result = "*****************************niYa8j4avjNIe"}
            @{Length = 38; Result = "****314Z5GMkBtLnXRPfWTl3JPeiVniYa8j4avjNIe"}
        )
        It "leaves <Length> characters visible" {
            param ($Length, $Result)

            Get-ObscureToken -Token $Token -VisibleLength $Length | Should Be $Result
        } -TestCases $Cases
    }
}
