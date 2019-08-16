using Okta.Sdk;
using Okta.Sdk.Configuration;
using System.Management.Automation;

namespace Okta.PS
{
    [Cmdlet(VerbsCommunications.Disconnect, "Okta")]
    public class DisconnectOktaCommand : Cmdlet
    {
        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            Config.Client = null;
        }

        protected override void EndProcessing() { }
    }
}
