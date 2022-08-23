using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BasketBallRegistration.DAL.BasketBallTableAdapters;
using BasketBallRegistration.DAL;

namespace BasketBallRegistration
{
    public partial class frmPlayer : AdminPage
    {
        int PK;
        string mode;
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
            mode = Request.QueryString["mode"];

            var dtPlayers = new BasketBall.PlayersDataTable();
            var taPlayers = new PlayersTableAdapter();

            if (Page.IsPostBack == false )
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
                        this.txtBI_PIN.Text = playerRow.BI_PIN;
                        this.txtName.Text = playerRow.Name;
                        this.dteOfBirth.Date = playerRow.DateOfBirth;
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
                        this.DropDownList1.SelectedValue = playerRow.RoleId.ToString();
                        this.txtRegistrarEmail.Text = playerRow.RegistrarEmail;
                        this.dteRegistered.Date = playerRow.DateRegistered;
                        this.ddPayed.SelectedValue = playerRow.Payed.ToString();
                    }
                }

            }

         
        }
        protected void cmdSave_Click(object sender, EventArgs e)
        {
            var taAT = new AuditTrailTableAdapter();
            var taPlayers = new PlayersTableAdapter();
            mode = Request.QueryString["mode"];
            PK = Convert.ToInt32(Request.QueryString["PK"]);
            if (mode == "edit")
            {
                try
                {
                    taPlayers.Update(txtBI_PIN.Text,
                        txtName.Text, 
                        DateOfBirth:dteOfBirth.Date,
                        ddGender.SelectedValue, 
                        txtAddress.Text,
                        txtEmail.Text,
                        PhoneNumber:txtPhoneNumber.Text,
                        txtMedicalConditions.Text,
                        txtEmergencyContactNumber.Text,
                        txtEmergencyContactRel.Text,
                        txtAllergies.Text,
                        txtMedicalNotes.Text,
                        txtCountryOfBirth.Text,
                        txtParentName.Text,
                        txtParentEmail.Text,
                        txtParentPhoneNumber.Text,
                        Convert.ToInt32(DropDownList1.SelectedValue),                        
                        txtRegistrarEmail.Text,
                        dteRegistered.Date,
                        Convert.ToBoolean(Convert.ToInt32(ddPayed.SelectedValue)),
                        PK);

                    taAT.Insert(0, 0, Context.Profile.UserName, DateTime.Now, 15, "Player Edited");
                }catch (Exception ex)
                {
                    //Log it \/

                    taAT.Insert(0, 0, Context.Profile.UserName, DateTime.Now, 15, ex.Message);
                }                
            }
            else if (mode == "add")
            {
                taPlayers.Insert(txtBI_PIN.Text,
                        txtName.Text,
                        dteOfBirth.Date,
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
                        Convert.ToInt32(DropDownList1.SelectedValue),
                        txtRegistrarEmail.Text,
                        DateTime.Now,
                        Convert.ToBoolean(Convert.ToInt32(ddPayed.SelectedValue)));
                Console.WriteLine("add");
                mode = "edit";
                taAT.Insert(0, 0, Context.Profile.UserName, DateTime.Now, 15, "Player Added");
            }
            Response.Redirect("/frmPlayer_Grid.aspx");
        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("/frmPlayer_Grid.aspx");
        }
    }
}