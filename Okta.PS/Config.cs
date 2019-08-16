using System.Collections.Generic;
using System.Linq;
using System.Management.Automation;
using System.Threading;
using System.Threading.Tasks;
using Okta.Sdk;
using Okta.Sdk.Configuration;
using System.Runtime.CompilerServices;

[assembly: InternalsVisibleToAttribute("xUnit.tests")]

namespace Okta.PS
{
    internal class Config
    {
        internal static OktaClient Client { get; set; }

        internal static OktaClientConfiguration GetOktaConnection()
        {
            OktaClientConfiguration config = new OktaClientConfiguration
            {
                OktaDomain = Config.Client.Configuration.OktaDomain,
                Token = Config.ObscureToken(Config.Client.Configuration.Token)
            };
            OktaClient client = new OktaClient(config);
            return client.Configuration;
        }

        private static string ObscureToken(string token)
        {
            int obscureLength = token.Length - 8;
            string obscured = string.Concat("".PadLeft(obscureLength, '*'), token.Substring(obscureLength));
            return obscured;
        }
    }
}
