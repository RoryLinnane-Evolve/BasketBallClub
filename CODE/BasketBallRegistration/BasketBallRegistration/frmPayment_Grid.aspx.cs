﻿using BasketBallRegistration.DAL.BasketBallTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static BasketBallRegistration.DAL.BasketBall;

namespace BasketBallRegistration
{
    public partial class frmPayment_Grid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPayment.aspx?mode=add");
        }

        protected void cmdEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPayment.aspx?mode=edit&PK=" + grdPayments.SelectedValue);
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPlayer_Grid.aspx");
        }

        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            var taPayments = new PaymentsTableAdapter();
            taPayments.Delete((int)grdPayments.SelectedValue);
            //Log
            var taAT = new AuditTrailTableAdapter();
            taAT.Insert(0, 0, Context.User.Identity.Name, DateTime.Now, 10, "Player Deleted");
            Refresh_Grid();
        }
        public void Refresh_Grid()
        {
            PaymentsTableAdapter taPlayers = new PaymentsTableAdapter();
            PaymentsDataTable dtPlayers = new PaymentsDataTable();
            DataView dv;
            taPlayers.FillBy_Grid(dtPlayers);
            dv = dtPlayers.DefaultView;
            this.grdPayments.DataSourceID = "";
            this.grdPayments.DataSource = dv;
            this.grdPayments.DataBind();
        }
    }
}