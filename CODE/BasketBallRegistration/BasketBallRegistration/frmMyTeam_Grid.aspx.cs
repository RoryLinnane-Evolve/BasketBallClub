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
    public partial class frmMyTeam_Grid : CoachPage
    {
        protected override void OnPreLoad(EventArgs e)
        {
            base.OnPreLoad(e);
            PlayersTableAdapter taPlayers = new PlayersTableAdapter();
            Setup_PlayerTeamsTableAdapter taPlayerTeams = new Setup_PlayerTeamsTableAdapter();
            Setup_CoachTeamsTableAdapter taCoachTeams = new Setup_CoachTeamsTableAdapter();
            AspNetUsersTableAdapter taUsers = new AspNetUsersTableAdapter();

            if ((int)taPlayers.TeamAgeFromCoachEmail((string)Session["Email"]) <= 17)
            {
                grdPlayers.Columns[6].Visible=false;
                grdPlayers.Columns[7].Visible=false;
                grdPlayers.Columns[9].Visible=false;
                grdPlayers.Columns[10].Visible=false;
                grdPlayers.Columns[15].Visible=false;
            }
            else
            {
                grdPlayers.Columns[13].Visible = false;
                grdPlayers.Columns[14].Visible = false;
                grdPlayers.Columns[15].Visible = false;
                grdPlayers.Columns[16].Visible = false;
                grdPlayers.Columns[].Visible = false;
            }

            
            grdPlayers.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmRegister_Grid.aspx");
        }        
    }
}