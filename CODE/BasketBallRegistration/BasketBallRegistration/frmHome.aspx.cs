using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasketBallRegistration
{
    public partial class frmHome : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Name = Context.User.Identity.Name;
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", $"welcome(\"Welcome {Name}!\")",true);
        }
    }
}