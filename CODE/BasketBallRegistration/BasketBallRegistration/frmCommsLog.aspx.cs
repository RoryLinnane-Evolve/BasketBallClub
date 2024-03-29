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

            BasketBall.CommsLogDataTable dtCommsLog = new BasketBall.CommsLogDataTable();
            CommsLogTableAdapter taCommsLog = new CommsLogTableAdapter();

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
                dtCommsLog = taCommsLog.GetData_PK(PK);

                if(mode == "view")
                {
                    foreach (var paymentRow in dtCommsLog)
                    {
                        this.txtCommsContent.Text = paymentRow.CommsContent;
                        this.txtCustomerId.Text = paymentRow.CustomerId.ToString();
                        this.txtCommsStatusId.Text = paymentRow.CommsStatusId.ToString();
                        this.txtCommsTo.Text= paymentRow.CommsTo.ToString();
                        this.txtCommsCopy.Text= paymentRow.CommsCopy.ToString();
                        this.dteCommsDate.Date= paymentRow.CommsDate.Date;
                        this.txtCommsContent.Enabled=false;
                        this.txtCustomerId.Enabled = false;
                        this.txtCommsStatusId.Enabled = false;
                        this.txtCommsTo.Enabled = false;
                        this.txtCommsCopy.Enabled = false;
                        this.dteCommsDate.Enabled = false;
                        this.cmdSave.Enabled = false;
                    }
                }
            }
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            mode = Request.QueryString["mode"];
            PK = Convert.ToInt32(Request.QueryString["PK"]);

            AuditTrailTableAdapter taAT = new AuditTrailTableAdapter();
            CommsLogTableAdapter taCommsLog = new CommsLogTableAdapter();
            if (mode == "view")
            {
                Response.Redirect("/frmCommsLog_Grid.aspx");
            }else if(mode == "add")
            {                
                taAT.Insert(0, 0, Context.Profile.UserName, DateTime.Now, 15, "CommsLog Entry added.");
            }
            Response.Redirect("/frmCommsLog_Grid.aspx");
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("/frmCommsLog_Grid.aspx");
        }
    }
}