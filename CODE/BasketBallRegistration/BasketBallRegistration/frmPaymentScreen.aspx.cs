using BasketBallRegistration.DAL.BasketBallTableAdapters;
using BasketBallRegistration.DAL.SetupsTableAdapters;
using RestSharp.Authenticators;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace BasketBallRegistration
{
    public partial class frmPaymentScreen : AuthPage
    {
        public decimal Price;
        int ChildAmount;
        int AdultAmount;

        PaymentsTableAdapter taPayments = new PaymentsTableAdapter();
        AuditTrailTableAdapter taAT = new AuditTrailTableAdapter();
        CommsLogTableAdapter taCommsLog = new CommsLogTableAdapter();
        PlayersTableAdapter taPlayers = new PlayersTableAdapter();
        AspNetUsersTableAdapter taUsers = new AspNetUsersTableAdapter();

        /*
         --Add Controller for players payment status for update on success
         
         
         */
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            Price = (decimal)Session["Price"];
            ChildAmount = (int)Session["ChildAmount"];
            AdultAmount = (int)Session["AdultAmount"];

            if ((string)Session["CODE"] != Request.QueryString["CODE"])
                Response.Redirect("~/frmRegister_Grid.aspx");
            else
            {
                return;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
        }

        [WebMethod]
        public void UpdatePlayerStatus()
        {
            string Names = "";

            var cart = taPlayers.GetDataBy_Cart(Context.User.Identity.Name);

            //Notify Coaches
            foreach (var player in cart)
            {
                Names += $"{player.Name}, ";
                NotifyCoach(player);
            }

            //Names.Remove(Names.Length - 2, Names.Length);

            //Update Player.Payed
            taPlayers.UpdatePayedStatus(true, Context.User.Identity.Name);

            //Log Payment
            var UserId = (string)taUsers.Get_Id_From_Email(Context.User.Identity.Name);
            taPayments.Insert(1, DateTime.Now, Price, Names, UserId, Context.User.Identity.Name);

            //Email Receipt
            string Subject = "Thank you!";
            //FIX
            string Body = $@"Your payment of €{Price} amount was successful!\nYou paid for Adult/s and  child/ren";
            SendSimpleMessage(Subject, Body, Context.User.Identity.Name);

            //E.G https://localhost:44351/frmPaymentSuccess.aspx?amount=485.00&adultAmount=1&childAmount=2

            //Log the action....
            taAT.Insert(null, null, Context.User.Identity.Name, DateTime.Now, 8, "Payment made");

            //Log the Communication...
            taCommsLog.Insert(null, DateTime.Now, 1, 1, Context.User.Identity.Name, "", Body);
        }
        public RestResponse SendSimpleMessage(string Subject, string Body, string to)
        {
            try
            {
                RestClient client = new RestClient();
                client.Options.BaseUrl = new Uri("https://api.mailgun.net/v3");
                client.Authenticator =
                new HttpBasicAuthenticator("api", "72eeaed369cddb89be3abd9c8c193aac-4dd50799-b51673a6");
                RestRequest request = new RestRequest();
                request.AddParameter("domain", "sandbox3b3511d760304093b6c580da58d9128a.mailgun.org", ParameterType.UrlSegment);
                request.Resource = "{domain}/messages";
                request.AddParameter("from", "Clare Cascaders <postmaster@sandbox3b3511d760304093b6c580da58d9128a.mailgun.org>");
                request.AddParameter("to", to);
                request.AddParameter("subject", Subject);
                request.AddParameter("text", Body);
                request.Method = Method.Post;

                return client.Execute(request);
            }
            catch (Exception ex)
            {
                taAT.Insert(null, null, Context.User.Identity.Name, DateTime.Now, 8, ex.Message);
                return null;
            }
        }

        public void NotifyCoach(DataRow player)
        {
            WhatsappService client = new WhatsappService();
            QueriesTableAdapter taQueries = new QueriesTableAdapter();
            client.SendAsync(new Microsoft.AspNet.Identity.IdentityMessage()
            {
                Body = $"{player["Name"]} has registered with your team.",
                Destination = $"{taQueries.CoachPhoneFromPlrId(PlayerId: (int)player["PlayerId"])}"
            });
        }
    }
}