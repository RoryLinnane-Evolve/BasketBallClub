﻿using BasketBallRegistration.DAL;
using BasketBallRegistration.DAL.BasketBallTableAdapters;
using System;
using System.Web.UI;

namespace BasketBallRegistration
{
    public partial class frmRegister : AuthPage
    {
        int PK;
        string mode;
        int RoleId;

        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load();
            mode = Request.QueryString["mode"];

            var dtPlayers = new BasketBall.PlayersDataTable();
            var taPlayers = new PlayersTableAdapter();

            if (Page.IsPostBack == false)
            {
                PK = Convert.ToInt32(Request.QueryString["PK"]);
                
                dtPlayers = taPlayers.GetData_PK(PK);

                if (mode == "edit")
                {
                    foreach (var playerRow in dtPlayers)
                    {
                        this.txtName.Text = playerRow.Name;
                        this.txtBIPin.Text = playerRow.BI_PIN;
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
            mode = Request.QueryString["mode"];
            if (Valid())
            {
                ErrorLabel.Visible = false;
                if (mode == "add")
                {
                    Add();
                }
                else if (mode == "edit")
                {
                    Edit();
                }
                Response.Redirect("frmRegister_Grid.aspx");
            }
            else
                ErrorLabel.Visible=true;
        }
        private void Edit()
        {
            int RoleId;
            if (DateTime.ParseExact(dteOfBirth.Text, "dd/MM/yyyy", null).Year >= DateTime.Now.Year - 17)
                RoleId = 2;
            else
                RoleId = 1;
            var taPlayers = new PlayersTableAdapter();

            var taAT = new AuditTrailTableAdapter();

            PK = Convert.ToInt32(Request.QueryString["PK"]);


            try
            {
                taPlayers.Update(txtBIPin.Text,
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

        private void Add()
        {

            if (DateTime.ParseExact(dteOfBirth.Text, "dd/MM/yyyy", null).Year >= DateTime.Now.Year - 17)
                RoleId = 2;
            else
                RoleId = 1;

            var taPlayers = new PlayersTableAdapter();

            var taAT = new AuditTrailTableAdapter();

            mode = Request.QueryString["mode"];

            try
            {
                taPlayers.Insert(txtBIPin.Text,
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
            }
            catch (Exception ex)
            {
                taAT.Insert(0, 0, Context.Profile.UserName, DateTime.Now, 15, ex.Message);
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

        public bool Valid()
        {
            if (RoleId == 1)
            {
                if (!string.IsNullOrEmpty(txtEmail.Text) &&
                    !string.IsNullOrEmpty(txtPhoneNumber.Text) &&
                    !string.IsNullOrEmpty(txtEmergencyContactNumber.Text) &&
                    !string.IsNullOrEmpty(txtEmergencyContactRel.Text))
                {
                    return true;
                }
                else
                    return false;
            }
            else
            {
                if (!string.IsNullOrEmpty(txtCountryOfBirth.Text) &&
                    !string.IsNullOrEmpty(txtParentName.Text) &&
                    !string.IsNullOrEmpty(txtParentEmail.Text) &&
                    !string.IsNullOrEmpty(txtParentPhoneNumber.Text))
                {
                    return true;
                }
                else
                    return false;
            }
            return false;
        }
    }
}