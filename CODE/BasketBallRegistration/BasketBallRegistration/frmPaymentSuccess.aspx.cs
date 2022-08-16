using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasketBallRegistration
{
    public partial class frmPaymentSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            success_header.InnerText = "Payment of {amount} was successful!";
        }
    }
}