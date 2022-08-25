using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasketBallRegistration.Account
{
    public partial class Logout : AuthPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
            //FormsAuthentication.SignOut();

            Session.Abandon();
            FormsAuthentication.SignOut();
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}