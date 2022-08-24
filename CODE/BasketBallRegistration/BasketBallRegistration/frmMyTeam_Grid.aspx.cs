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
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
            //PlayersTableAdapter taPlayers = new PlayersTableAdapter();
            //Setup_PlayerTeamsTableAdapter taPlayerTeams = new Setup_PlayerTeamsTableAdapter();
            //Setup_CoachTeamsTableAdapter taCoachTeams = new Setup_CoachTeamsTableAdapter();
            //AspNetUsersTableAdapter taUsers = new AspNetUsersTableAdapter();

            //string CoachId = taUsers.Get_Id_From_Email(Context.User.Identity.Name);
            //int? age = taPlayerTeams.GetAgeFromId((int)taCoachTeams.FillBy_Coach(taUsers.Get_Id_From_Email(Context.User.Identity.Name)));
            //DataView dv = new DataView();
            //if (age.HasValue)
            //{
            //    var dtPlayers = new PlayersDataTable();
            //    taPlayers.FillBy_DOB(dtPlayers, new DateTime(DateTime.Now.Year - (int)age, 1, 1), new DateTime(DateTime.Now.Year - ((int)age - 2), 1, 1), "M");

            //    dv = dtPlayers.DefaultView;
            //}
            //grdPlayers.DataSourceID = "";
            //grdPlayers.DataSource = dv;
            //grdPlayers.DataBind();
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmRegister_Grid.aspx");
        }        
    }
}