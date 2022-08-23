using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BasketBallRegistration.DAL.BasketBallTableAdapters;

namespace BasketBallRegistration
{
    /*
    --BI_PIN input in this page    
    --Update in this page
    --Insert in Register_Grid.aspx
    --Delete on cancle in this page
    */
    public partial class frmInputBIPin : AuthPage
    {
        
        PlayersTableAdapter taPlayers = new PlayersTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
            var register_form = (frmRegister)Session["RegisterForm"];
            register_form.
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Update BI_PIN

            var register_form = (frmRegister)Session["RegisterForm"];
            taPlayers.Insert(null,
                            register_form.txtName.Text,
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
            //Cant get PK??
        }
    }
}