using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BasketBallRegistration.DAL.BasketBallTableAdapters;
using BasketBallRegistration.DAL;

namespace BasketBallRegistration
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool Logon(string UserName, string Password)
        {
            
            UsersTableAdapter taUserName = new UsersTableAdapter();
            BasketBall.UsersDataTable dtUsername = new BasketBall.UsersDataTable();

            // 1. First Check are the Administrators
            dtUsername = taUserName.GetDataBy_CheckLogon(UserName, Password);
            if (dtUsername.Rows.Count != 0)
            {
                foreach (BasketBall.UsersRow UserRow in dtUsername)
                {
                    if (UserRow != null)
                        return true;
                    else
                        return false;
                }            
            }
            return false;
        }

        protected void cmdLogon_Click(object sender, EventArgs e)
        {
            if (Logon(txtUserName.Text, txtPassword.Text))
                Response.Redirect("frmHome.aspx");
            else
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Error()", true);
        }
    }
}