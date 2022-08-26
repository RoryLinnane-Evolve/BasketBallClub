using BasketBallRegistration.DAL.SetupsTableAdapters;
using System;
using System.Web.UI;

namespace BasketBallRegistration
{
    public class CoachPage : Page
    {
        protected virtual void Page_Load()
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                AspNetUserRolesTableAdapter taRoles = new AspNetUserRolesTableAdapter();
                if (Convert.ToInt32(taRoles.ROLE_FROM_EMAIL(Context.User.Identity.Name)) == 1)
                {
                    Session["Email"] = Context.User.Identity.Name;
                    return;
                }

                else
                    Response.Redirect("~/frmRegister_Grid.aspx");
            }
            else
                Response.Redirect("~/frmRegister_Grid.aspx");
        }
    }
}