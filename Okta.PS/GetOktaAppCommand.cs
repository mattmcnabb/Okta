using Okta.Sdk;
using System.Collections.Generic;
using System.Linq;
using System.Management.Automation;

namespace Okta.PS
{
    [Cmdlet(VerbsCommon.Get, "OktaApp", DefaultParameterSetName = "Identity")]
    [OutputType(typeof(Application))]
    public class GetOktaAppCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "Identity")]
        public string Identity { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "Filter")]
        public string Filter { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "User", ValueFromPipeline = true)]
        public User User { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "Group", ValueFromPipeline = true)]
        public Group Group { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "All")]
        public SwitchParameter All { get; set; }

        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            switch (this.ParameterSetName)
            {
                case "Identity":
                    WriteObject(
                         Config.Client.Applications.GetApplicationAsync(Identity).Result
                    );
                    break;

                case "Filter":
                    WriteObject(
                        Config.Client.Applications.ListApplications(filter: Filter).ToList().Result,
                        true
                    );
                    break;

                case "User":
                    string userId = User.Id;
                    string userFilter = string.Format("user.id eq \"{0}\"", userId);
                    string expand = string.Format("user/{0}", userId);
                    WriteObject(
                        Config.Client.Applications.ListApplications(filter: userFilter, expand: expand).ToList().Result
                    );
                    break;

                case "Group":
                    string groupId = Group.Id;
                    string groupFilter = string.Format("group.id eq \"{0}\"", groupId);
                    WriteObject(
                        Config.Client.Applications.ListApplications(filter: groupFilter).ToList().Result
                    );
                    break;

                case "All":
                    WriteObject(
                        Config.Client.Applications.ListApplications().ToList().Result,
                        true
                    );
                    break;
            }
        }

        protected override void EndProcessing() { }
    }
}
