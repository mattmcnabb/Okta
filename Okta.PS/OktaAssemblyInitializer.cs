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
    public class OktaAssemblyInitializer : IModuleAssemblyInitializer
    {
        //the client connection should be rebuilt on module import
        void IModuleAssemblyInitializer.OnImport()
        {
            Config.Client = null;
        }
    }
}
