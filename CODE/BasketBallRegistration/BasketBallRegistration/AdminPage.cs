using BasketBallRegistration.DAL.SetupsTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace BasketBallRegistration
{
    public class AdminPage : Page
    {
        protected virtual void Page_Load()
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                AspNetUserRolesTableAdapter taRoles = new AspNetUserRolesTableAdapter();
                if (Convert.ToInt32(taRoles.ROLE_FROM_EMAIL(Context.User.Identity.Name)) == 3)
                    return;
                else
                    Response.Redirect("~/frmRegister_Grid.aspx");
            }else
                Response.Redirect("~/frmRegister_Grid.aspx");
        }
    }
}