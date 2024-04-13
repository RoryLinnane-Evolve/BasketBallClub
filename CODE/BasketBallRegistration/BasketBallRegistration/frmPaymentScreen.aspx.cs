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
using Microsoft.Ajax.Utilities;
using System.Web.Script.Services;
using static BasketBallRegistration.DAL.BasketBall;

namespace BasketBallRegistration
{
    public partial class frmPaymentScreen : AuthPage
    {
        public static decimal Price;
        static int ChildAmount;
        static int AdultAmount;
        
        public string unpaidPlayersList;

        static HttpContext context;

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
            context = Context;
            Price = (decimal)Session["Price"];
            ChildAmount = (int)Session["ChildAmount"];
            AdultAmount = (int)Session["AdultAmount"];


            if ((string)Session["CODE"] != Request.QueryString["CODE"])
                Response.Redirect("~/frmRegister_Grid.aspx");
            else
            {
                var Unpaid= taPlayers.GetDataBy_Cart(context.User.Identity.Name);
                foreach(var item in Unpaid)
                {
                    unpaidPlayersList += $"<br/><label>{item.Name},</label>";
                }
                unpaidPlayersList += $"<br/><label>Total Amount: {Price}</label>";
                return;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
        }


        public void Complete()
        {
            PaymentsTableAdapter taPayments = new PaymentsTableAdapter();
            AuditTrailTableAdapter taAT = new AuditTrailTableAdapter();
            CommsLogTableAdapter taCommsLog = new CommsLogTableAdapter();
            PlayersTableAdapter taPlayers = new PlayersTableAdapter();
            AspNetUsersTableAdapter taUsers = new AspNetUsersTableAdapter();

            string Names = "";

            var cart = taPlayers.GetDataBy_Cart(context.User.Identity.Name);

            //Notify Coaches
            foreach (var player in cart)
            {
                Names += $"{player.Name}, ";
                NotifyCoach(player);
            }

            //Names.Remove(Names.Length - 2, Names.Length);

            //Log Payment
            var UserId = (string)taUsers.Get_Id_From_Email(context.User.Identity.Name);
            taPayments.Insert(1, DateTime.Now, Price, Names, UserId, context.User.Identity.Name);

            //Email Receipt
            string Subject = "Thank you!";
            //FIX
            string Body = $@"Your payment of €{Price} amount was successful!\nYou paid for Adult/s and  child/ren";
            SendSimpleMessage(Subject, Body, context.User.Identity.Name);

            //E.G https://localhost:44351/frmPaymentSuccess.aspx?amount=485.00&adultAmount=1&childAmount=2

            //Log the action....
            taAT.Insert(null, null, context.User.Identity.Name, DateTime.Now, 8, "Payment made");

            //Log the Communication...
            taCommsLog.Insert(null, DateTime.Now, 1, 1, context.User.Identity.Name, "", Body);

        }

        public int UpdatePlayerStatus()
        {
            //Update Player.Payed
            taPlayers.UpdatePayedStatus(true, Context.User.Identity.Name);
            return 1;
        }


        public static RestResponse SendSimpleMessage(string Subject, string Body, string to)
        {
            AuditTrailTableAdapter taAT = new AuditTrailTableAdapter();
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
                taAT.Insert(null, null, context.User.Identity.Name, DateTime.Now, 8, ex.Message);
                return null;
            }
        }

        public static void NotifyCoach(DataRow player)
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