using Okta.Sdk;
using System.Linq;
using System.Management.Automation;

namespace Okta.PS
{
    [Cmdlet(VerbsCommon.Get, "OktaPolicyRule")]
    [OutputType(typeof(PolicyRule))]
    public class GetOktaPolicyRuleCommand : PSCmdlet
    {
        [Parameter()]
        public string RuleId { get; set; }

        [Parameter(Mandatory = true, ValueFromPipelineByPropertyName = true)]
        [Alias("PolicyId")]
        public string Id { get; set; }
        
        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            switch (this.MyInvocation.BoundParameters.ContainsKey("RuleId"))
            {
                case true:
                    WriteObject(Config.Client.Policies.GetPolicyRuleAsync(Id, RuleId).Result);
                    break;
                case false:
                    WriteObject(Config.Client.Policies.ListPolicyRules(Id).ToList().Result);
                    break;
            }
        }
        protected override void EndProcessing() { }
    }
}
