using BasketBallRegistration.DAL.BasketBallTableAdapters;
using System;
using System.Data;
using System.Web.UI;
using static BasketBallRegistration.DAL.BasketBall;

namespace BasketBallRegistration
{
    public partial class frmPlayer_Grid : AdminPage
    {
        PlayersTableAdapter taPlayers = new PlayersTableAdapter();
        PlayersDataTable src = new PlayersDataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
            if (Page.IsPostBack == false)
                ddRole.SelectedValue = "1";


            grdPlayers.DataSourceID = null;
            src = taPlayers.GetDataBy_Grid();
            src = taPlayers.GetDataBy_Search(txtSearch.Text, 1);
            grdPlayers.DataSource = src;
            grdPlayers.DataBind();
        }

        protected void cmdAdd_Click1(object sender, EventArgs e)
        {
            Response.Redirect("frmPlayer.aspx?mode=add");
        }

        protected void cmdEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPlayer.aspx?mode=edit&PK=" + grdPlayers.SelectedValue);
        }

        protected void ddRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            var taPlayers = new PlayersTableAdapter();
            src = taPlayers.GetDataBy_Search(txtSearch.Text, Convert.ToInt32(ddRole.SelectedValue));
            grdPlayers.DataSource = src;
            grdPlayers.DataBind();
        }

        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            var taPlayers = new PlayersTableAdapter();
            taPlayers.Delete((int)grdPlayers.SelectedValue);
            //Log
            var taAT = new AuditTrailTableAdapter();
            taAT.Insert(0, 0, Context.User.Identity.Name, DateTime.Now, 10, "Player Deleted");
            Refresh_Grid();
        }
        public void Refresh_Grid()
        {
            PlayersTableAdapter taPlayers = new PlayersTableAdapter();
            PlayersDataTable dtPlayers = new PlayersDataTable();
            DataView dv;
            taPlayers.FillBy_Grid(dtPlayers);
            dv = dtPlayers.DefaultView;
            this.grdPlayers.DataSourceID = "";
            this.grdPlayers.DataSource = dv;
            this.grdPlayers.DataBind();
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmHome.aspx");
        }


        protected void cmdGo_Click(object sender, EventArgs e)
        {
            //TODO: Search works once and doesnt after

            //Refresh_Grid();

            var pt = new PlayersTableAdapter();
            var table = pt.GetDataBy_Search(txtSearch.Text, Convert.ToInt32(ddRole.SelectedValue));
            grdPlayers.DataSourceID = null;
            grdPlayers.DataSource = table;
            grdPlayers.DataBind();
        }
    }
}