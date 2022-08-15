using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BasketBallRegistration.DAL;
using BasketBallRegistration.DAL.BasketBallTableAdapters;

namespace BasketBallRegistration
{
    public partial class frmRegister : System.Web.UI.Page
    {
        BasketBall.PlayersDataTable cart = new BasketBall.PlayersDataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            grdPlayers.DataSource = cart;
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
            var player = cart.Where(x => x.PlayerId == Convert.ToInt32(grdPlayers.SelectedValue));
            cart.RemovePlayersRow(player.First());
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmHome.aspx");
        }
    }
}