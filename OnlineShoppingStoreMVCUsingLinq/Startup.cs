using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(OnlineShoppingStoreMVCUsingLinq.Startup))]
namespace OnlineShoppingStoreMVCUsingLinq
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
