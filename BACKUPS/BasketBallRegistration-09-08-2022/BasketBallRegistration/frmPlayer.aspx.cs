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
    public partial class frmPlayer : System.Web.UI.Page
    {
        int PK;
        string mode;


        protected void Page_Load(object sender, EventArgs e)
        {
            var mode = Request.QueryString["mode"];

            var dtPlayers = new BasketBall.PlayersDataTable();
            var taPlayers = new PlayersTableAdapter();

            PK = Convert.ToInt32(Request.QueryString["PK"]);

            dtPlayers = taPlayers.GetData_PK(PK);

            if(mode == "edit")
            {
            
                foreach (var playerRow in dtPlayers)
                {
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
                    this.txtRole.Text = playerRow.RoleId.ToString();
                    this.txtRegistrarEmail.Text = playerRow.RegistrarEmail;
                    this.dteRegistered.Date = playerRow.DateRegistered;
                }
            }else if (mode == "add")
            {
             
            }
        }

        protected void SchemeStatus_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            SaveData();
            Response.Redirect("frmPlayer_Grid");
        }
        void SaveData()
        {
            var taPlayers = new PlayersTableAdapter();

            if(mode == "edit")
            {
                taPlayers.Update(dteOfBirth.Date,txtName.Text,
                    ddGender.SelectedValue,txtAddress.Text, 
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
                    Convert.ToInt32(txtRole), 
                    txtParentPhoneNumber.Text,
                    txtRegistrarEmail.Text, 
                    dteRegistered.Date, 
                    PK);
                //Log it
                var taAT = new AuditTrailTableAdapter();
                taAT.Insert(0,0,Context.Profile.UserName,DateTime.Now, 15,"");
            } else if(mode == "add")
            {
                taPlayers.Insert(dteOfBirth.Date, txtName.Text,
                    ddGender.SelectedValue, txtAddress.Text,
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
                    Convert.ToInt32(txtRole),
                    txtParentPhoneNumber.Text,
                    txtRegistrarEmail.Text,
                    DateTime.Now);
                
                mode = "edit";
            }

        }

        protected void cmdClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPlayer_Grid.aspx");
        }
    }
}