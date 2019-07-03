param
(
    $ModulePath
)

Import-Module $ModulePath -Force

InModuleScope "Okta" {
    Describe "Connect-Okta" {
        BeforeAll {
            $Domain = "https://nuffin.okta.com"
            $Token = "00rc314Z5GMkBtLnXRPfWTl3JPeiVniYa8j4avjNIe"
            $BadDomain = "http://nuffin.okta.com" # should always be https
            $BadToken = "00rc314Z5GMkBtLnXRPfWTl3JPeiVniYa8j4avjNIem" # 43 chars is too much
        }

        Context "parameter validation" {
            It "validates domain input" {
                {Connect-Okta -OktaDomain $BadDomain} | Should Throw "Cannot validate argument on parameter 'OktaDomain'"
            }

            It "validates token input" {
                {Connect-Okta -OktaDomain $Domain -ApiToken $BadToken} | Should Throw "Cannot validate argument on parameter 'ApiToken'"
            }
        }
    
        Context "connection failure" {
            Mock Get-CurrentUser {throw} -Verifiable

            It "throws on connection failure" {
                {Connect-Okta -OktaDomain $Domain -ApiToken $Token} | Should Throw
            }

            It "doesn't add client to module config on failure" {
                $Script:ModuleClient | Should BeNullOrEmpty
            }
        }            

        Context "connection success" {
            Mock Get-CurrentUser {} -Verifiable
            Mock Get-OktaConnection {} -Verifiable
            $null = Connect-Okta $Domain $Token
            
            It "adds client to module config" {
                $Script:ModuleClient | Should Not BeNullOrEmpty
            }

            It "outputs the connection" {
                Assert-MockCalled Get-OktaConnection -Times 1
            }

            Assert-VerifiableMock
        }
    }
}
