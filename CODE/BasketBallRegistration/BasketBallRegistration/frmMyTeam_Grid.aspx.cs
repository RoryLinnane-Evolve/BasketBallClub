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
            Setup_PlayerTeamsTableAdapter taPlayerTeams = new Setup_PlayerTeamsTableAdapter();
            Setup_CoachTeamsTableAdapter taCoachTeams = new Setup_CoachTeamsTableAdapter();
            AspNetUsersTableAdapter taUsers = new AspNetUsersTableAdapter();
            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            PlayersTableAdapter taPlayers = new PlayersTableAdapter();
            base.Page_Load();
            var temp = (int)taPlayers.TeamAgeFromCoachEmail((string)Session["Email"]);
            if (temp <= 17 && temp != 0)
            {
                grdPlayers.Columns[6].Visible = false;
                grdPlayers.Columns[8].Visible = false;
                grdPlayers.Columns[9].Visible = false;
            }
            else if (temp == 0)
            {
                grdPlayers.Columns[12].Visible = false;
                grdPlayers.Columns[13].Visible = false;
                grdPlayers.Columns[14].Visible = false;
            }


            grdPlayers.DataBind();
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmRegister_Grid.aspx");
        }        
    }
}