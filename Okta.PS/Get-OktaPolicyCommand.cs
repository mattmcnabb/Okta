using Okta.Sdk;
using System.Collections.Generic;
using System.Linq;
using System.Management.Automation;
using System.Threading.Tasks;

namespace Okta.PS
{
    [Cmdlet(VerbsCommon.Get, "OktaPolicy", DefaultParameterSetName = "Identity")]
    [OutputType(typeof(Policy))]
    public class GetOktaPolicyCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, ParameterSetName = "Identity")]
        public string Identity { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "Type")]
        [ValidateSet("OktaSignOn", "Password")]
        public string Type { get; set; }
        
        protected Task<List<IPolicy>> GetPolicyTaskByType(string type)
        {
            switch (type)
            {
                case "OktaSignOn":
                    return Config.Client.Policies.ListPolicies(PolicyType.OktaSignOn).ToList();
                default:
                    return Config.Client.Policies.ListPolicies(PolicyType.Password).ToList();
            }
        }

        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            switch (this.ParameterSetName)
            {
                case "Identity":
                    WriteObject(Config.Client.Policies.GetPolicyAsync(Identity).Result);
                    break;
                case "Type":
                    WriteObject(
                        GetPolicyTaskByType(Type).Result,
                        true
                    );
                    break;
            }
        }
        protected override void EndProcessing() { }
    }
}
