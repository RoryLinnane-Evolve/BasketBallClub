using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasketBallRegistration
{
    public partial class frmRegister1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {

        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            //Response.Redirect("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=2X58QUZZEV3E8");
            decimal amount = 0.5m;
            Response.Redirect($"https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=G2TDTBCFJJVM4&lc=IE&item_name=Test%20product&amount={amount.ToString().Split('.')[0]}%2e{amount.ToString().Split('.')[1]}&currency_code=EUR&button_subtype=services&no_note=0&cn=Add%20special%20instructions%20to%20the%20seller%3a&no_shipping=2&bn=PP%2dBuyNowBF%3abtn_buynowCC_LG%2egif%3aNonHosted");
        }
    }
}