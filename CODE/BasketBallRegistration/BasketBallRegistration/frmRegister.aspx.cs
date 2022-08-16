using BasketBallRegistration.DAL;
using BasketBallRegistration.DAL.BasketBallTableAdapters;
using System;
using System.Web.UI;

namespace BasketBallRegistration
{
    public partial class frmRegister1 : System.Web.UI.Page
    {
        int PK;
        string mode;


        protected void Page_Load(object sender, EventArgs e)
        {
            mode = Request.QueryString["mode"];

            var dtPlayers = new BasketBall.PlayersDataTable();
            var taPlayers = new PlayersTableAdapter();

            if (Page.IsPostBack == false)
            {
                try
                {
                    PK = Convert.ToInt32(Request.QueryString["PK"]);
                }
                catch (Exception)
                {
                    Response.Redirect("frmPlayer_Grid.aspx");
                }
                dtPlayers = taPlayers.GetData_PK(PK);

                if (mode == "edit")
                {

                    foreach (var playerRow in dtPlayers)
                    {
                        this.txtName.Text = playerRow.Name;
                        this.dteOfBirth.Text = playerRow.DateOfBirth.ToShortDateString();
                        this.ddGender.SelectedValue = playerRow.Gender.ToCharArray()[0].ToString();
                        this.txtAddress.Text = playerRow.Address;
                        this.txtEmail.Text = playerRow.Email;
                        this.txtPhoneNumber.Text = playerRow.PhoneNumber;
                        this.txtMedicalConditions.Text = playerRow.MedicalConditions;
                        this.txtEmergencyContactNumber.Text = playerRow.EmergencyContactNumber;
                        this.txtEmergencyContactRel.Text = playerRow.EmergencyContactRelationship;
                        this.txtAllergies.Text = playerRow.Allergies;
                        this.txtMedicalNotes.Text = playerRow.MedicalNotes;
                        this.txtCountryOfBirth.Text = playerRow.CountryOfBirth;
                        this.txtParentName.Text = playerRow.ParentName;
                        this.txtParentEmail.Text = playerRow.ParentEmail;
                        this.txtParentPhoneNumber.Text = playerRow.ParentPhoneNumber;
                    }
                    RaisePostBackEvent();
                }
                else if (mode == "add")
                {
                    ParentEmailRow.Visible = false;
                    ParentNameRow.Visible = false;
                    ParentPhoneRow.Visible = false;
                    CountryRow.Visible = false;
                    EmailRow.Visible = false;
                    PhoneNumberRow.Visible = false;
                    EmContactRow.Visible = false;
                    EmContactRelRow.Visible = false;
                }

            }
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            int RoleId;
            if (DateTime.ParseExact(dteOfBirth.Text, "dd/MM/yyyy", null).Year >= DateTime.Now.Year - 17)
                RoleId = 2;
            else
                RoleId = 1;

            var taPlayers = new PlayersTableAdapter();

            var taAT = new AuditTrailTableAdapter();

            mode = Request.QueryString["mode"];
            PK = Convert.ToInt32(Request.QueryString["PK"]);

            if (mode == "add")
            {
                try
                {
                    taPlayers.Insert(null,
                            txtName.Text,
                            DateTime.ParseExact(dteOfBirth.Text, "dd/MM/yyyy", null),
                            ddGender.SelectedValue,
                            txtAddress.Text,
                            txtEmail.Text,
                            txtPhoneNumber.Text,
                            txtMedicalConditions.Text,
                            txtEmergencyContactNumber.Text,
                            txtEmergencyContactRel.Text,
                            txtAllergies.Text,
                            txtMedicalNotes.Text,
                            txtCountryOfBirth.Text,
                            txtParentName.Text,
                            txtParentEmail.Text,
                            txtParentPhoneNumber.Text,
                            RoleId,
                            Context.User.Identity.Name,
                            DateTime.Now,
                            false);
                    taAT.Insert(0, 0, Context.Profile.UserName, DateTime.Now, 15, "Player Added To Cart");
                    Response.Redirect("frmRegister_Grid.aspx");
                }
                catch (Exception ex)
                {
                    taAT.Insert(0, 0, Context.Profile.UserName, DateTime.Now, 15, ex.Message);
                }
            }
            else if (mode == "edit")
            {
                try
                {
                    taPlayers.Update(String.Empty,
                            txtName.Text,
                            DateTime.ParseExact(dteOfBirth.Text, "dd/MM/yyyy", null),
                            ddGender.SelectedValue,
                            txtAddress.Text,
                            txtEmail.Text,
                            txtPhoneNumber.Text,
                            txtMedicalConditions.Text,
                            txtEmergencyContactNumber.Text,
                            txtEmergencyContactRel.Text,
                            txtAllergies.Text,
                            txtMedicalNotes.Text,
                            txtCountryOfBirth.Text,
                            txtParentName.Text,
                            txtParentEmail.Text,
                            txtParentPhoneNumber.Text,
                            RoleId,
                            Context.User.Identity.Name,
                            DateTime.Now,
                            false,
                            PK);
                    taAT.Insert(0, 0, Context.Profile.UserName, DateTime.Now, 15, "Player Edited In Cart");
                    Response.Redirect("frmRegister_Grid.aspx");
                }
                catch (Exception ex)
                {
                    taAT.Insert(0, 0, Context.User.Identity.Name, DateTime.Now, 15, ex.Message);
                    throw ex;
                }
            }
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmRegister_Grid.aspx");
        }

        protected void dteOfBirth_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (DateTime.ParseExact(dteOfBirth.Text, "dd/MM/yyyy", null).Year >= DateTime.Now.Year - 17)
                {
                    ParentEmailRow.Visible = true;
                    ParentNameRow.Visible = true;
                    ParentPhoneRow.Visible = true;
                    CountryRow.Visible = true;

                    EmailRow.Visible = false;
                    txtEmail.Text = null;
                    PhoneNumberRow.Visible = false;
                    txtPhoneNumber.Text = null;
                    EmContactRow.Visible = false;
                    txtEmergencyContactNumber.Text = null;
                    EmContactRelRow.Visible = false;
                    txtEmergencyContactRel.Text = null;
                }
                else
                {
                    ParentEmailRow.Visible = false;
                    txtParentEmail.Text = null;
                    ParentNameRow.Visible = false;
                    txtParentName.Text = null;
                    ParentPhoneRow.Visible = false;
                    txtPhoneNumber.Text = null;
                    CountryRow.Visible = false;
                    txtCountryOfBirth.Text = null;

                    EmailRow.Visible = true;
                    PhoneNumberRow.Visible = true;
                    EmContactRow.Visible = true;
                    EmContactRelRow.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine(dteOfBirth.Text);
            }
        }
        public void RaisePostBackEvent()
        {
            dteOfBirth_TextChanged(sender: new object(), e: new EventArgs());
        }
    }
}