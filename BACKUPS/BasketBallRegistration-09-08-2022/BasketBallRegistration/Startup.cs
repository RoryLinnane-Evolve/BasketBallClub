using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BasketBallRegistration.Startup))]
namespace BasketBallRegistration
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
