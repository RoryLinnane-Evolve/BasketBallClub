using BasketBallRegistration.DAL.SetupsTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Twilio.Http;

namespace BasketBallRegistration
{
    public class AuthPage : Page
    {
        protected virtual void Page_Load()
        {
            if (!Context.User.Identity.IsAuthenticated)
                Response.Redirect("~/frmHome");
        }
    }
}