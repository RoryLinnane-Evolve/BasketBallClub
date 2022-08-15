using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasketBallRegistration
{
    public partial class frmPlayer_Grid : System.Web.UI.Page
    {
        int SelectedRoleId = 1;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdSchemes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cmdAdd_Click1(object sender, EventArgs e)
        {
            Response.Redirect("frmPlayer.aspx?mode=add");
        }

        protected void cmdEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPlayer.aspx?mode=edit&PK=" + grdPlayers.SelectedValue);
        }

        protected void cmbCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page_Load(sender, e);
        }
    }
}