using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BasketBallRegistration.DAL.SetupsTableAdapters;
using Microsoft.AspNet.Identity;

namespace BasketBallRegistration
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;
        

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            optPlayers.Visible = false;
            optMyTeam.Visible = false;
            optPayment.Visible = false;
            ddUtils.Visible = false;
            AspNetUserRolesTableAdapter taUserRoles = new AspNetUserRolesTableAdapter();

            optLogin.Visible = false;
            optLogout.Visible = false;
            optManage.Visible = false;
            optRegister.Visible = false;

            if (Context.User.Identity.IsAuthenticated)
            {
                optLogout.Visible = true;
                optManage.Visible = true;
            }
            else
            {
                optLogin.Visible = false;
                optRegister.Visible = false;
            }

            int? roleId = Convert.ToInt32(taUserRoles.ROLE_FROM_EMAIL(Context.User.Identity.Name));

            

            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
            if (roleId != null)
            {
                if (roleId == 3)
                {
                    optPlayers.Visible = true;
                    optMyTeam.Visible = true;
                    optPayment.Visible = true;
                    ddUtils.Visible = true;
                }
                else if (roleId == 1)
                {
                    optMyTeam.Visible = true;
                }
                else if (roleId == 2)
                {
                    optPayment.Visible = true;
                    ddUtils.Visible = true;
                }
                else
                {
                    optPlayers.Visible = false;
                    optMyTeam.Visible = false;
                    optPayment.Visible = false;
                    ddUtils.Visible = false;
                    optMyTeam.Visible = false;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Logout.aspx");
        }

        protected void lnkManage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Manage.aspx");
        }

        protected void lnkAccountRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Register.aspx");
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Login.aspx");
        }

        protected void lnkCommsLog_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/frmCommsLog_Grid.aspx");
        }

        protected void lnkAuditTrail_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/frmAuditTrail_Grid.aspx");
        }
    }

}