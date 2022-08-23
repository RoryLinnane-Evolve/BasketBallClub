using BasketBallRegistration.DAL.BasketBallTableAdapters;
using BasketBallRegistration.DAL.SetupsTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using static BasketBallRegistration.DAL.BasketBall;
using static BasketBallRegistration.DAL.Setups;

namespace BasketBallRegistration
{
    public partial class frmRegister_Grid : AuthPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
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

            decimal amount = PRICE_CALC();

            Session["amount"] = amount;

            Response.Redirect($"https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=G2TDTBCFJJVM4&lc=IE&item_name=Registration%20Fee&amount={amount.ToString().Split('.')[0]}%2e{amount.ToString().Split('.')[1]}&currency_code=EUR&button_subtype=services&no_note=1&no_shipping=1&bn=PP%2dBuyNowBF%3abtn_buynowCC_LG%2egif%3aNonHosted");
        }

        /// <summary>
        /// Calculates price of players in cart (includes discounts)
        /// </summary>
        /// <returns>decimal of price</returns>
        decimal PRICE_CALC()
        {
            decimal total = 0;
            var taPlayers = new PlayersTableAdapter();
            var taAT = new AuditTrailTableAdapter();
            var cart = taPlayers.GetDataBy_Cart(Context.User.Identity.Name);

            Setup_RatesTableAdapter taRates = new Setup_RatesTableAdapter();
            Setup_RatesDataTable RatesTable = new Setup_RatesDataTable();

            taRates.FillBy_Grid(RatesTable);

            List<int> cYears = new List<int>();

            Dictionary<string, decimal> first_rates = new Dictionary<string, decimal>();
            Dictionary<string, decimal> second_rates = new Dictionary<string, decimal>();

            //Putting rates into dictionary

            foreach (var row in RatesTable)
            {
                first_rates.Add(row.RateName, row.FirstChild);
                second_rates.Add(row.RateName, row.SecondChild);
            }            

            foreach (var row in cart)
            {
                if (row.DateOfBirth.Year >= DateTime.Now.Year - 17)
                    cYears.Add(row.DateOfBirth.Year);
                else
                    total += 180.0M;
            }
            decimal cTotal = 0;
            foreach (int c in cYears)
            {
                if (cTotal == 0)
                {
                    if (ChildIsUnder8(c))
                    {
                        cTotal += first_rates["U8"];
                    }
                    else if (ChildIsUnder10(c))
                    {
                        cTotal += first_rates["U10"];
                    }
                    else if (ChildIsUnder12(c))
                    {
                        cTotal += first_rates["U12"];
                    }
                    else if (ChildIsUnder14(c))
                    {
                        cTotal += first_rates["U14"];
                    }
                    else if (ChildIsUnder16(c))
                    {
                        cTotal += first_rates["U16"];
                    }
                    else if (ChildIsUnder18(c))
                    {
                        cTotal += first_rates["U18"];
                    }
                    else if (ChildIsUnder20(c))
                    {
                        cTotal += first_rates["U20"];
                    }
                }
                else
                {
                    if (ChildIsUnder8(c))
                    {
                        cTotal += second_rates["U8"];
                    }
                    else if (ChildIsUnder10(c))
                    {
                        cTotal += second_rates["U10"];
                    }
                    else if (ChildIsUnder12(c))
                    {
                        cTotal += second_rates["U12"];
                    }
                    else if (ChildIsUnder14(c))
                    {
                        cTotal += second_rates["U14"];
                    }
                    else if (ChildIsUnder16(c))
                    {
                        cTotal += second_rates["U16"];
                    }
                    else if (ChildIsUnder18(c))
                    {
                        cTotal += second_rates["U18"];
                    }
                    else if (ChildIsUnder20(c))
                    {
                        cTotal += second_rates["U20"];
                    }
                }
            }

            decimal x = total + cTotal;

            x = ((x / 98) * 100) + 0.35M;
            return x;
        }

        #region classification methods
        private static bool ChildIsUnder8(int Year)
        {
            int age = DateTime.Now.Year - Year;
            if (age <= 7)
                return true;
            else
                return false;
        }
        private static bool ChildIsUnder10(int Year)
        {
            int age = DateTime.Now.Year - Year;
            if (age <= 9)
                return true;
            else
                return false;
        }

        private static bool ChildIsUnder12(int Year)
        {
            int age = DateTime.Now.Year - Year;
            if (age <= 11)
                return true;
            else
                return false;
        }
        private static bool ChildIsUnder14(int Year)
        {
            int age = DateTime.Now.Year - Year;
            if (age <= 13)
                return true;
            else
                return false;
        }
        private static bool ChildIsUnder16(int Year)
        {
            int age = DateTime.Now.Year - Year;
            if (age <= 15)
                return true;
            else
                return false;
        }
        private static bool ChildIsUnder18(int Year)
        {
            int age = DateTime.Now.Year - Year;
            if (age <= 17)
                return true;
            else
                return false;
        }

        private static bool ChildIsUnder20(int Year)
        {
            int age = DateTime.Now.Year - Year;
            if (age <= 19)
                return true;
            else
                return false;
        }
        #endregion

    }
}