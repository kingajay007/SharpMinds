using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SharpMinds.Web.Startup))]
namespace SharpMinds.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
