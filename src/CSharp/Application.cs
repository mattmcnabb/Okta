using Okta.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Okta.PS
{
    public class Application
    {
        public static async Task<List<Okta.Sdk.IApplication>> GetAllApplications(OktaClient client)
        {
            List<Okta.Sdk.IApplication> a = await client.Applications.ListApplications().ToList();
            return a;
        }
    }
}