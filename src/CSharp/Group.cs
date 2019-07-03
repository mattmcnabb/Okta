using Okta.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Okta.PS
{
    public class Group
    {
        public static async Task<List<Okta.Sdk.IGroup>> GetAllGroups(OktaClient client)
        {
            List<Okta.Sdk.IGroup> g = await client.Groups.ListGroups().ToList();
            return g;
        }
    }
}