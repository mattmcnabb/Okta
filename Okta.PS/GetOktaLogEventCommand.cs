using Okta.Sdk;
using System;
using System.Linq;
using System.Management.Automation;

namespace Okta.PS
{
    [Cmdlet(VerbsCommon.Get, "OktaLogEvent", DefaultParameterSetName = "Filter")]
    [OutputType(typeof(LogEvent))]
    public class GetOktaLogEventCommand : PSCmdlet
    {
        [Parameter(Mandatory = false)]
        public DateTime StartDate { get; set; } = DateTime.Now.AddDays(-7);

        [Parameter(Mandatory = false)]
        public DateTime EndDate { get; set; } = DateTime.Now;

        [Parameter(Mandatory = true, ParameterSetName = "All")]
        public SwitchParameter All { get; set; }

        [Parameter(Mandatory = true, ValueFromPipelineByPropertyName = true, ParameterSetName = "TargetId")]
        [Alias("Id")]
        public string TargetId { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "Filter")]
        public string Filter { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "Keywords")]
        public string Keywords { get; set; }

        protected override void BeginProcessing() { }

        protected override void ProcessRecord()
        {
            switch (this.ParameterSetName)
            {
                case "All":
                    WriteObject(
                        Config.Client.Logs.GetLogs(
                            since: StartDate.ToString("o"),
                            until: EndDate.ToString("o")
                        ).ToList().Result, true
                    );
                    break;

                case "TargetId":
                    WriteObject(
                        Config.Client.Logs.GetLogs(
                            filter: string.Format("target.id eq \"{0}\" or actor.id eq \"{0}\"", TargetId),
                            since: StartDate.ToString("o"),
                            until: EndDate.ToString("o")
                        ).ToList().Result, true
                    );
                    break;

                case "Filter":
                    WriteObject(
                        Config.Client.Logs.GetLogs(
                            filter: Filter,
                            since: StartDate.ToString("o"),
                            until: EndDate.ToString("o")
                        ).ToList().Result, true
                    );
                    break;

                case "Keywords":
                    WriteObject(
                        Config.Client.Logs.GetLogs(
                            q: Keywords,
                            since: StartDate.ToString("o"),
                            until: EndDate.ToString("o")
                        ).ToList().Result, true
                    );
                    break;
            }
        }

        protected override void EndProcessing() { }
    }
}
