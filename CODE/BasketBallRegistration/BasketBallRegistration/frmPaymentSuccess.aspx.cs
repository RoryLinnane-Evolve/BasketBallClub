using BasketBallRegistration.DAL.BasketBallTableAdapters;
using MimeKit;
using RestSharp;
using RestSharp.Authenticators;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace BasketBallRegistration
{
    public partial class frmPaymentSuccess : System.Web.UI.Page
    {
        PaymentsTableAdapter taPayments = new PaymentsTableAdapter();
        AuditTrailTableAdapter taAT = new AuditTrailTableAdapter();
        CommsLogTableAdapter taCommsLog = new CommsLogTableAdapter();
        PlayersTableAdapter taPlayers = new PlayersTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            int PK = Convert.ToInt32(Request.QueryString["PK"]);

            decimal amount = Convert.ToDecimal(Request.QueryString["amount"]);
            string adultAmount = Request.QueryString["adultAmount"];
            string childAmount = Request.QueryString["childAmount"];

            success_header.InnerText = $"Payment of €{amount} was successful!";
            taPayments.Insert(null, null, null, DateTime.Now, amount, Context.User.Identity.Name);
            
            string Subject = "Thank you!";
            string Body = $@"Your payment of €{amount} amount was successful!\nYou paid for {adultAmount} Adult/s and {childAmount} child/ren";
            SendSimpleMessage(Subject, Body, Context.User.Identity.Name);

            // You can see a record of this email in your logs: https://app.mailgun.com/app/logs.

            // You can send up to 300 emails/day from this sandbox server.
            // Next, you should add your own domain so you can send 10000 emails/month for free.

            //E.G https://localhost:44351/frmPaymentSuccess.aspx?amount=485.00&adultAmount=1&childAmount=2

            //Update Player.Payed
            taPlayers.UpdatePayedStatus(true, Context.User.Identity.Name);
            
            taAT.Insert(null, null, Context.User.Identity.Name, DateTime.Now, 8, "Payment made");
            
        }
        public RestResponse SendSimpleMessage(string Subject, string Body, string to)
        {
            try
            {
                RestClient client = new RestClient();
                client.Options.BaseUrl = new Uri("https://api.mailgun.net/v3");
                client.Authenticator =
                new HttpBasicAuthenticator("api",
                                            "72eeaed369cddb89be3abd9c8c193aac-4dd50799-b51673a6");
                RestRequest request = new RestRequest();
                request.AddParameter("domain", "sandbox3b3511d760304093b6c580da58d9128a.mailgun.org", ParameterType.UrlSegment);
                request.Resource = "{domain}/messages";
                request.AddParameter("from", "Clare Cascaders <postmaster@sandbox3b3511d760304093b6c580da58d9128a.mailgun.org>");
                request.AddParameter("to", to);
                request.AddParameter("subject", Subject);
                request.AddParameter("text", Body);
                request.Method = Method.Post;
                taCommsLog.Insert(null, DateTime.Now, 1, 1, Context.User.Identity.Name, "", Body);
                return client.Execute(request);
            }catch (Exception ex)
            {
                taAT.Insert(null, null, Context.User.Identity.Name, DateTime.Now, 8, ex.Message);
                return null;
            }
        }
    }
}