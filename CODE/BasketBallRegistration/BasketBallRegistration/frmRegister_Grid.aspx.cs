using BasketBallRegistration.DAL.BasketBallTableAdapters;
using System;
using System.Data;
using static BasketBallRegistration.DAL.BasketBall;


namespace BasketBallRegistration
{
    public partial class frmRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var taPlayers = new PlayersTableAdapter();
            var dtPlayers = taPlayers.GetDataBy_Cart(Context.User.Identity.Name);
            grdPlayers.DataSourceID = null;
            grdPlayers.DataSource = dtPlayers;
        }

        protected void cmdAdd_Click1(object sender, EventArgs e)
        {
            Response.Redirect("frmRegister.aspx?mode=add");
        }

        protected void cmdEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect($"frmRegister?mode=edit&PK={grdPlayers.SelectedValue}");
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
            taPlayers.FillBy_Cart(dtPlayers, Context.User.Identity.Name);
            dv = dtPlayers.DefaultView;
            this.grdPlayers.DataSourceID = "";
            this.grdPlayers.DataSource = dv;
            this.grdPlayers.DataBind();
        }

        protected void cmdContinue_Click(object sender, EventArgs e)
        {
            var taPlayers = new PlayersTableAdapter();

            decimal amount = (decimal)taPlayers.PRICE_CALC(Context.User.Identity.Name);
            Response.Redirect($"https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=G2TDTBCFJJVM4&lc=IE&item_name=Registration%20Fee&amount={amount.ToString().Split('.')[0]}%2e{amount.ToString().Split('.')[1]}&currency_code=EUR&button_subtype=services&no_note=0&cn=Add%20special%20instructions%20to%20the%20seller%3a&no_shipping=2&bn=PP%2dBuyNowBF%3abtn_buynowCC_LG%2egif%3aNonHosted");
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmHome.aspx");
        }
    }
}