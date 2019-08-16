using Okta.Sdk;
using System.Linq;
using System.Management.Automation;

namespace Okta.PS
{
    [Cmdlet(VerbsCommon.Get, "OktaUserAdminRole")]
    [OutputType(typeof(Role))]
    public class GetOktaUserAdminRoleCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, ValueFromPipeline = true)]
        public User User { get; set; }

        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            WriteObject(User.Roles.ToList().Result, true);
        }

        protected override void EndProcessing() { }
    }
}
