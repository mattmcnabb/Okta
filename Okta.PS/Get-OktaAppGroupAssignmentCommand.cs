using Okta.Sdk;
using System.Linq;
using System.Management.Automation;

namespace Okta.PS
{
    [Cmdlet(VerbsCommon.Get, "OktaAppGroupAssignment")]
    [OutputType(typeof(ApplicationGroupAssignment))]
    public class GetOktaAppGroupAssignmentCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, ValueFromPipeline = true)]
        public Application App { get; set; }

        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            WriteObject (
                App.ListGroupAssignments().ToList().Result,
                true
            );
        }
        protected override void EndProcessing() { }
    }
}
