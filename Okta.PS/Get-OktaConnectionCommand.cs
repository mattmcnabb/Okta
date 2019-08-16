using Okta.Sdk.Configuration;
using System.Management.Automation;

namespace Okta.PS
{
    [Cmdlet(VerbsCommon.Get, "OktaConnection")]
    [OutputType(typeof(OktaClientConfiguration))]
    public class GetOktaConnectionCommand : PSCmdlet
    {
        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            WriteObject(Config.GetOktaConnection());
        }

        protected override void EndProcessing() { }
    }
}
