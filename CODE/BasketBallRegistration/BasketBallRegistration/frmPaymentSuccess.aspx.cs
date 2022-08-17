using BasketBallRegistration.DAL.BasketBallTableAdapters;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            decimal amount = Convert.ToDecimal(Request.QueryString["amount"]);
            string adultAmount = Request.QueryString["adultAmount"];
            string childAmount = Request.QueryString["childAmount"];

            success_header.InnerText = $"Payment of €{amount} was successful!";
            PaymentsTableAdapter taPayments = new PaymentsTableAdapter();
            AuditTrailTableAdapter taAT = new AuditTrailTableAdapter();
            CommsLogTableAdapter taCommsLog = new CommsLogTableAdapter();
            taPayments.Insert(null, null, null, DateTime.Now, amount, Context.User.Identity.Name);
            //string to = Context.User.Identity.Name;
            string Subject = "Thank you!";
            string Body = $@"Your payment of €{amount} amount was successful!\nYou paid for {adultAmount} Adults and {childAmount}";
            //SmtpClient client = new SmtpClient("smtp.google.com", 587)
            //{
            //    Credentials = new NetworkCredential("18-0003@cbsennistymon.com", ConfigurationManager.AppSettings["MailBotPassowrd"]),
            //    EnableSsl = true
            //};
            //client.Send("18-0003@cbsennistymon.com", Context.User.Identity.Name, Subject, Body);


            // TWILIO CODE\\//
            //var accountSid = "ACda6d1fd27f903506acd5a572495263f4";
            //var authToken = "e1cd9de3f8f86fbb964a36c175f92056";
            //TwilioClient.Init(accountSid, authToken);

            //var messageOptions = new CreateMessageOptions(
            //    new PhoneNumber("+353852863224"));
            //messageOptions.MessagingServiceSid = "MG4c5e12ad2f179ab036b0bcd6d13cedb9";
            //messageOptions.Body = $@"Your payment of €{amount} amount was successful!\nYou paid for {adultAmount} Adults and {childAmount}";

            //var message = MessageResource.Create(messageOptions);
            //Console.WriteLine(message.Body);
            taCommsLog.Insert(null, DateTime.Now, 1, 1, Context.User.Identity.Name, "", Body);
            taAT.Insert(null, null, Context.User.Identity.Name, DateTime.Now, 8, "Payment made");
            
        }
    }
}