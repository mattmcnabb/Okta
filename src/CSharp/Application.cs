using Okta.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Okta.PS
{
    public class Application
    {
        private Okta.Sdk.IApplication OktaSdkApplication { get; set; }

        public Okta.Sdk.IApplicationAccessibility Accessibility => OktaSdkApplication.Accessibility;
        public DateTimeOffset? Created => OktaSdkApplication.Created;
        public Okta.Sdk.IApplicationCredentials Credentials => OktaSdkApplication.Credentials;
        public IList<string> Features => OktaSdkApplication.Features;
        public string Id => OktaSdkApplication.Id;
        public string Label => OktaSdkApplication.Label;
        public DateTimeOffset? LastUpdated => OktaSdkApplication.LastUpdated;
        public Okta.Sdk.IApplicationLicensing Licensing => OktaSdkApplication.Licensing;
        public string Name => OktaSdkApplication.Name;
        public Okta.Sdk.Resource Profile => OktaSdkApplication.Profile;
        public Okta.Sdk.IApplicationSettings Settings => OktaSdkApplication.Settings;
        public Okta.Sdk.ApplicationSignOnMode SignOnMode => OktaSdkApplication.SignOnMode;
        public string Status => OktaSdkApplication.Status;
        public Okta.Sdk.IApplicationVisibility Visibility => OktaSdkApplication.Visibility;

        public Application(Okta.Sdk.IApplication oktaSdkApplication)
        {
            OktaSdkApplication = oktaSdkApplication;
        }

        public static async Task<Okta.Sdk.IApplication> GetApplication(OktaClient client, string identity)
        {
            Okta.Sdk.IApplication u = await client.Applications.GetApplicationAsync(identity);
            return u;
        }

        public static async Task<List<Okta.Sdk.IApplication>> FilterApplications(OktaClient client, string filter)
        {
            List<Okta.Sdk.IApplication> u = await client.Applications.ListApplications(filter: filter).ToList();
            return u;
        }

        public static async Task<List<Okta.Sdk.IApplication>> GetAllApplications(OktaClient client)
        {
            List<Okta.Sdk.IApplication> a = await client.Applications.ListApplications().ToList();
            return a;
        }
    }
}
