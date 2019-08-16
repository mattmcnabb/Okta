using Okta.Sdk;
using Okta.Sdk.Configuration;
using System.Management.Automation;

namespace Okta.PS
{
    [Cmdlet(VerbsCommunications.Connect, "Okta")]
    public class ConnectOktaCommand : Cmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        [ValidatePattern("^https\\:\\/\\/[a-zA-Z-0-9]+\\.(okta|oktapreview)\\.com$")]
        public string OktaDomain { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        [ValidatePattern("^00[a-zA-Z0-9-_]{40}$")]
        public string ApiToken { get; set; }

        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            OktaClientConfiguration config = new OktaClientConfiguration
            {
                OktaDomain = OktaDomain,
                Token = ApiToken
            };
            OktaClient client = new OktaClient(config);

            // test that the connection works by retrieving the current user
            client.GetAsync<Okta.Sdk.User>(new HttpRequest { Uri = "/api/v1/users/me" }).Wait();
            
            Config.Client = client;
            WriteObject(Config.GetOktaConnection());
        }

        protected override void EndProcessing() { }
    }
}
