using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BasketBallRegistration.DAL.SetupsTableAdapters;
using BasketBallRegistration.DAL.BasketBallTableAdapters;
using System.Data;
using static BasketBallRegistration.DAL.BasketBall;

namespace BasketBallRegistration
{
    public partial class frmMyTeam_Grid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmHome.aspx");
        }

        protected void cmbCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            PlayersTableAdapter taPlayers = new PlayersTableAdapter();
            Setup_PlayerTeamsTableAdapter taTeams = new Setup_PlayerTeamsTableAdapter();
            int? age = taTeams.GetAgeFromId(Convert.ToInt32(cmbCustomer.SelectedValue));
            DataView dv = new DataView();
            if (age.HasValue)
            {
                var dtPlayers = new PlayersDataTable();
                taPlayers.FillBy_DOB(dtPlayers, new DateTime(DateTime.Now.Year - (int)age, 1, 1), new DateTime(DateTime.Now.Year - ((int)age-2),1,1), "M");
                
                dv = dtPlayers.DefaultView;
            }
            grdPlayers.DataSourceID = "";
            grdPlayers.DataSource = dv;
            grdPlayers.DataBind();
        }
    }
}