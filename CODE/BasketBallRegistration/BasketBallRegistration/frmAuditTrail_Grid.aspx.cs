using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasketBallRegistration
{
    public partial class frmAuditTrail_Grid : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("/frmHome.aspx");
        }
    }
}