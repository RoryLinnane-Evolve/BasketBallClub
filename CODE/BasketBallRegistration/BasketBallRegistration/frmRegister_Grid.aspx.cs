using BasketBallRegistration.DAL.BasketBallTableAdapters;
using BasketBallRegistration.DAL.SetupsTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using static BasketBallRegistration.DAL.BasketBall;
using static BasketBallRegistration.DAL.Setups;

namespace BasketBallRegistration
{
    public partial class frmRegister_Grid : AuthPage
    {
        private static Random random = new Random();

        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
            Refresh_Grid();
        }

        protected void cmdAdd_Click1(object sender, EventArgs e)
        {
            Response.Redirect("frmRegister.aspx?mode=add");
        }

        protected void cmdEdit_Click(object sender, EventArgs e)
        {
            if(grdPlayers.SelectedValue != null)
                Response.Redirect($"frmRegister?mode=edit&PK={grdPlayers.SelectedValue}");
        }

        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            if (grdPlayers.SelectedValue != null)
            {
                var taPlayers = new PlayersTableAdapter();

                taPlayers.Delete((int)grdPlayers.SelectedValue);
                //Log
                var taAT = new AuditTrailTableAdapter();
                taAT.Insert(0, 0, Context.User.Identity.Name, DateTime.Now, 10, "Player Deleted");
                Refresh_Grid();
            }            
        }

        /// <summary>
        /// Updates the grdPlayers with new information from the database
        /// </summary>
        public void Refresh_Grid()
        {
            PlayersTableAdapter taPlayers = new PlayersTableAdapter();
            PlayersDataTable dtPlayers = new PlayersDataTable();
            DataView dv;
            taPlayers.FillBy_Cart(dtPlayers, Context.User.Identity.Name);
            dv = dtPlayers.DefaultView;
            foreach(DataRow Row in dv.Table.Rows)
            {
                Row["DateOfBirth"]= Row["DateOfBirth"].ToString().Substring(0,10);
            }
            this.grdPlayers.DataSourceID = null;
            this.grdPlayers.DataSource = dv;
            this.grdPlayers.DataBind();
            if (grdPlayers.Rows.Count == 0)
                cmdContinue.Visible = false;
        }

        protected void cmdContinue_Click(object sender, EventArgs e)
        {
            var taPlayers = new PlayersTableAdapter();

            decimal amount = PRICE_CALC();

            string CODE = RandomString(random.Next(35));

            Session["CODE"] = CODE;
            Session["amount"] = amount;

            //Response.Redirect($"https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=DKRSXRN4CYXF2&lc=IE&item_name=Registration%20Fee&amount={amount.ToString().Split('.')[0]}%2e{amount.ToString().Split('.')[1]}&currency_code=EUR&button_subtype=services&no_note=1&no_shipping=1&rm=1&return=https%3a%2f%2flocalhost%3a44351%2ffrmPaymentSuccess%2easpx&cancel_return=https%3a%2f%2flocalhost%3a44351%2ffrmPaymentFailed%2easpx&bn=PP%2dBuyNowBF%3abtn_buynowCC_LG%2egif%3aNonHosted");
            Response.Redirect($"~/frmPaymentScreen.aspx?CODE={CODE}");
        }

        /// <summary>
        /// Calculates price of players in cart (includes discounts)
        /// </summary>
        /// <returns>decimal of price</returns>
        public decimal PRICE_CALC()
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
                    total +=first_rates["Adult"];
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
            Session["Price"]=Decimal.Round(x, 2);
            Session["ChildAmount"] = cYears.Count;
            Session["AdultAmount"] = (int)(total / first_rates["Adult"]);
            return Decimal.Round(x, 2);
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