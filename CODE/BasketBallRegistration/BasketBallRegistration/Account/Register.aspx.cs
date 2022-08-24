using BasketBallRegistration.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Linq;
using System.Web;

namespace BasketBallRegistration.Account
{
    public partial class Register1 : System.Web.UI.Page
    {
        bool submitted = false;
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            CreateUser.Enabled = false;
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            if (submitted == false)
            {

                var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text }; IdentityResult result = manager.Create(user, Password.Text);
                if (result.Succeeded)
                {
                    // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                    string code = manager.GenerateEmailConfirmationToken(user.Id);
                    string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                    manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");
                    if (user.EmailConfirmed)
                    {
                        signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                        Response.Redirect("~/frmRegister_Grid.aspx");
                        //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    }
                    else
                    {
                        ErrorMessage.Text = "An email has been sent to your account. Please view the email and confirm your account to complete the registration process.";
                    }
                }
                else
                {
                    ErrorMessage.Text = result.Errors.FirstOrDefault();
                }
            }
        }
    }
}