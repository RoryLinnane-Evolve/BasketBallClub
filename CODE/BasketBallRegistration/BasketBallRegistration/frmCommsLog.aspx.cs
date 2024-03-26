using BasketBallRegistration.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BasketBallRegistration.DAL.BasketBallTableAdapters;

namespace BasketBallRegistration
{
    public partial class frmCommsLog : AdminPage
    {
        int PK;
        string mode;

        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
            mode = Request.QueryString["mode"];

            BasketBall.CommsLogDataTable dtPayments = new BasketBall.CommsLogDataTable();
            CommsLogTableAdapter taPayments = new CommsLogTableAdapter();

            if (Page.IsPostBack == false)
            {
                try
                {
                    PK = Convert.ToInt32(Request.QueryString["PK"]);
                }
                catch (Exception)
                {
                    Response.Redirect("frmCommsLog_Grid.aspx");
                }
                dtPayments = taPayments.GetData_PK(PK);

                if(mode == "edit")
                {
                    foreach (var paymentRow in dtPayments)
                    {
                        //this.txtAmount.Text = paymentRow.Amount.ToString();
                        //this.txtClient.Text = paymentRow.Client.ToString();
                        //this.txtCustomerId.Text = paymentRow.CustomerId.ToString();
                        //this.dtePaymentDate.Date = paymentRow.PaymentDate;
                        //this.txtPaymentReference.Text = paymentRow.PaymentReference;
                        //this.txtPaymentTypeId.Text = paymentRow.PaymentTypeId.ToString();
                    }
                }
            }
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            mode = Request.QueryString["mode"];
            PK = Convert.ToInt32(Request.QueryString["PK"]);

            AuditTrailTableAdapter taAT = new AuditTrailTableAdapter();
            PaymentsTableAdapter taPayments = new PaymentsTableAdapter();

            if (mode == "edit")
            {
                try
                {
                    //taPayments.Update(Convert.ToInt32(txtCustomerId.Text), Convert.ToInt32(txtPaymentTypeId.Text), Convert.ToInt32(txtClient.Text), dtePaymentDate.Date, Convert.ToDecimal(txtAmount.Text), txtPaymentReference.Text, PK);
                }catch (Exception ex)
                {
                    //Log it \/
                    taAT.Insert(0, 0, Context.Profile.UserName, DateTime.Now, 15, ex.Message);
                }
            }else if(mode == "add")
            {
                //taPayments.Insert(Convert.ToInt32(txtCustomerId.Text), Convert.ToInt32(txtPaymentTypeId.Text), Convert.ToInt32(txtClient.Text), dtePaymentDate.Date, Convert.ToInt32(txtAmount.Text), txtPaymentReference.Text);
                taAT.Insert(0, 0, Context.Profile.UserName, DateTime.Now, 15, "Payment Made");
            }
            Response.Redirect("/frmPayment_Grid.aspx");
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("/frmPayment_Grid.aspx");
        }
    }
}