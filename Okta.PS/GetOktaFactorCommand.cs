using Okta.Sdk;
using System.Linq;
using System.Management.Automation;

namespace Okta.PS
{
    [Cmdlet(VerbsCommon.Get, "OktaFactor")]
    [OutputType(typeof(Factor))]
    public class GetOktaFactorCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, ValueFromPipeline = true)]
        public User User { get; set; }

        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            WriteObject(User.ListFactors().ToList().Result, true);
        }

        protected override void EndProcessing() { }
    }
}
