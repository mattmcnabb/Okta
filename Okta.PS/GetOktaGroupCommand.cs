using Okta.Sdk;
using System.Collections.Generic;
using System.Linq;
using System.Management.Automation;

namespace Okta.PS
{
    [Cmdlet(VerbsCommon.Get, "OktaGroup", DefaultParameterSetName = "Identity")]
    [OutputType(typeof(Group))]
    public class GetOktaGroupCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "Identity")]
        public string Identity { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "Filter")]
        public string Filter { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "User", ValueFromPipeline = true)]
        public User User { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "App", ValueFromPipeline = true)]
        public Application App { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "All")]
        public SwitchParameter All { get; set; }

        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            switch (this.ParameterSetName)
            {
                case "Identity":
                    WriteObject(
                        Config.Client.Groups.GetGroupAsync(Identity).Result
                    );
                    break;

                case "Filter":
                    WriteObject(
                        Config.Client.Groups.ListGroups(filter: Filter).ToList().Result,
                        true
                    );
                    break;

                case "User":
                    WriteObject(
                        User.Groups.ToList().Result,
                        true
                    );
                    break;

                case "App":
                    var allGroups = Config.Client.Groups.ListGroups().ToList().Result;
                    var assignments = App.ListGroupAssignments().ToList().Result.Select(a => a.Id);
                    
                    WriteObject(allGroups.Where(g => assignments.Contains(g.Id)), true);
                    break;

                case "All":
                    WriteObject(
                        Config.Client.Groups.ListGroups().ToList().Result,
                        true
                    );
                    break;
            }
        }

        protected override void EndProcessing() { }
    }
}
