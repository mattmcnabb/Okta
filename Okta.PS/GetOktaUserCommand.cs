using Okta.Sdk;
using System.Linq;
using System.Management.Automation;

namespace Okta.PS
{
    [Cmdlet(VerbsCommon.Get, "OktaUser", DefaultParameterSetName = "Identity")]
    [OutputType(typeof(Okta.Sdk.User))]
    public class GetOktaUserCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "Identity")]
        public string Identity { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "Filter")]
        public string Filter { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "All")]
        public SwitchParameter All { get; set; }

        [Parameter(Mandatory = true,ValueFromPipeline = true, ParameterSetName = "Group")]
        public Group Group { get; set; }

        [Parameter(Mandatory = true, ValueFromPipeline = true, ParameterSetName = "App")]
        public Application App { get; set; }

        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            switch (this.ParameterSetName)
            {
                case "Identity":
                    WriteObject(
                        Config.Client.Users.GetUserAsync(Identity).Result
                    );
                    break;

                case "Filter":
                    WriteObject(
                        Config.Client.Users.ListUsers(filter: Filter).ToList().Result,
                        true
                    );
                    break;

                case "All":
                    WriteObject(
                        Config.Client.Users.ListUsers().ToList().Result,
                        true
                    );
                    break;

                case "Group":
                    WriteObject(
                        Group.Users.ToList().Result,
                        true
                    );
                    break;

                case "App":
                    WriteObject(
                        App.ListApplicationUsers().ToList().Result,
                        true
                    );
                    break;
            }
        }

        protected override void EndProcessing() { }
    }
}
